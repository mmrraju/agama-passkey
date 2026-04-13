<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <title>Sign in with password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${webCtx.contextPath}/servlet/favicon" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>tailwind.config = { darkMode: 'class' }</script>
</head>
<body>
<section class="bg-gray-100 dark:bg-gray-900">
    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
        <div class="flex items-center mb-6">
            <img class="w-40" src="https://gluu.org/wp-content/uploads/2021/02/janssen-project-transparent-630px-182px-300x86.png" alt="logo">
        </div>
        <div class="w-full bg-white rounded-lg shadow-lg dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <form method="post" enctype="application/x-www-form-urlencoded"
                  class="p-6 space-y-4 md:space-y-6 sm:p-8">

                <h1 class="text-xl text-center font-medium text-gray-900 md:text-2xl dark:text-white">
                    Enter your password
                </h1>

                <p class="text-sm text-gray-500 dark:text-gray-400 text-center">
                    Signing in as <span class="font-medium text-gray-900 dark:text-white">${username}</span>
                </p>

                <div>
                    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                        Password
                    </label>
                    <input type="password" name="password" id="password"
                           class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
                           required autocomplete="current-password">
                </div>

                <#if showError == true>
                    <div class="p-4 text-red-800 border border-red-300 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400 dark:border-red-800" role="alert">
                        <p class="text-sm font-medium">${errorTitle}</p>
                        <p class="mt-1 text-sm">${errorMessage}</p>
                    </div>
                </#if>

                <button type="submit" name="loginBtn"
                        class="w-full text-white bg-green-600 hover:bg-green-700 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                    Sign in
                </button>

                <div class="text-center">
                    <button type="submit" name="backBtn" formnovalidate
                            class="text-sm text-blue-600 hover:underline dark:text-blue-400">
                        Use a different username
                    </button>
                </div>

            </form>
        </div>
    </div>
</section>
</body>
</html>
