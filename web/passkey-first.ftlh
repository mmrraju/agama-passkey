[#ftl output_format="HTML"]
<!DOCTYPE html>
<html lang="en">
<head><meta name="viewport" content="width=device-width, initial-scale=1"><title>Sign in
	</title><link rel="icon" href="${webCtx.contextPath}/servlet/favicon" type="image/x-icon"></head>
<body>

  
	
	
	
  
  
	<section class="bg-gray-100 dark:bg-gray-900">
	  <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
		<div class="flex items-center mb-6">
		  <img src="https://gluu.org/wp-content/uploads/2021/02/janssen-project-transparent-630px-182px-300x86.png" alt="logo" class="w-40">
		</div>
		<div class="w-full bg-white rounded-lg shadow-lg dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
		  <form method="post" id="firstForm" enctype="application/x-www-form-urlencoded" class="p-6 space-y-4 md:space-y-6 sm:p-8">
			<h1 class="text-xl text-center font-medium text-gray-900 md:text-2xl dark:text-white">
			  Sign in
			</h1>
			<div>
			  <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
				Username
			  </label>
			  <input type="text" name="username" id="username" placeholder="" required="" autocomplete="username webauthn" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2-5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
			</div>
			<input type="hidden" id="tokenResponse" name="tokenResponse">
			<input type="hidden" id="skipped" name="skipped">
			<input type="hidden" id="errorMessage" name="errorMessage">
			&lt;#if showError == true&gt;
			<div role="alert" class="p-4 text-red-800 border border-red-300 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400 dark:border-red-800">
			  <p class="text-sm font-medium">${errorTitle}
			  </p>
			  <p class="mt-1 text-sm">${errorMessage}
			  </p>
			</div>
			<!--#if-->
			<button type="submit" name="continueBtn" class="w-full text-white bg-green-600 hover:bg-green-700 font-medium rounded-lg text-sm px-5 py-2-5 text-center">
			  Continue
			</button>
		  </form>
		  <div>
			<button type="submit" name="lostpasskey" value="lost" class="w-full text-white bg-green-600 hover:bg-green-700 font-medium rounded-lg text-sm px-5 py-2-5 text-center">
			  I have lost my Passkey
			</button>
		  </div>
		</div>
	  </div>
	</section>
  
  
  
  
  
  
  
</body>

<script src="https://cdn.tailwindcss.com"></script><script src="${webCtx.contextPath}/auth/fido2/js/base64js.js"></script><script src="${webCtx.contextPath}/auth/fido2/js/base64url.js"></script><script src="${webCtx.contextPath}/auth/fido2/js/webauthn.js"></script><script>tailwind.config = {
	  darkMode: 'class' }
  </script><script>
	let conditionalAbortController = null;
	function submitWithAssertion(assertionJson) {
	  document.getElementById("tokenResponse").value = assertionJson;
	  document.forms[0].submit();
	}
	async function startConditionalUI() {
	  if (!window.PublicKeyCredential ||
		  typeof PublicKeyCredential.isConditionalMediationAvailable !== 'function') {
		return;
	  }
	  const supported = await PublicKeyCredential.isConditionalMediationAvailable();
	  if (!supported) return;
	  try {
		const request = ${
		  assertion?no_esc};
		  conditionalAbortController = new AbortController();
		  request.signal = conditionalAbortController.signal;
		  request.mediation = 'conditional';
		  console.log('Starting conditional UI assertion');
		  webauthn.getAssertion(request)
			.then(data => {
			const assertionJson = JSON.stringify(webauthn.responseToObject(data));
			console.log('Conditional UI resolved');
			submitWithAssertion(assertionJson);
		  }
				 )
			.catch(err => {
			if (err.name === "AbortError") return;
			// user typed username instead
			console.error('Conditional UI error:', err);
		  }
				  );
		}
		catch (e) {
		  console.log('Conditional UI setup failed (non-fatal):', e);
		}
	  }
	  window.addEventListener("load", () => {
		startConditionalUI();
	  }
							 );
  </script>
</html>