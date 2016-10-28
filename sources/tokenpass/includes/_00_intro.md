
#Tokenpass API

**[Tokenpass](https://tokenpass.tokenly.com)** is a global accounts (OAuth) service powering the Tokenly ecosystem. 
It acts as a central hub for "Token Controlled Access" (TCA) requests, allowing
end users to register and prove ownership of their bitcoin addresses a single time instead of
individually for every TCA powered application, as well as providing a layer of privacy (among other features).

Use this API to integrate Tokenpass into your own website, game or other application and empower your project
with Token Controlled Access. 

##API Access

To obtain an API key pair for your application, simply head to [https://tokenpass.tokenly.com](https://tokenpass.tokenly.com), create an account and go to the "API Keys" section. 
You will then be asked to enter in a name for your client application, your app homepage URL, as well as a callback URL for OAuth requests (e.g https://example.com/account/authorize/callback)

Once your API keys are generated you are ready to integrate! 

If you are using **PHP**, we recommend you use our TokenpassClient library, which can be
downloaded on [github here](https://github.com/tokenly/tokenpass-client), or if using Composer it can be included via ```composer require tokenly/tokenpass-client```. 


