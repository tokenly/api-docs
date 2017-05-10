#Pay with Token Markets&trade;

```html
<!-- simple install -->
<script src="https://pay.tokenmarkets.com/pay.min.js"
        class="js-pay-with-token-markets"
        data-key="<MARKETS_API_KEY>" 
        data-company="<YOUR_COMPANY>"
        data-product="<YOUR_PRODUCT>"
        data-type="token"
        data-currency="tokenly"
        data-amount="10">
</script>

<!-- advanced install -->
<button id="pay-now-button">Pay Now</button>

<script type="text/javascript" src="https://pay.tokenmarkets.com/pay.min.js"></script>
<script type="text/javascript">
  var handler = PayWithTokenMarkets.configure({
    key: "<MARKETS_API_KEY>",
    company: "<YOUR_COMPANY>",
    product: "<YOUR_PRODUCT>",
    type: "token",
    currency: "SOUP",
    amount: "1",
    email: "john@example.com",
    meta: {
      invoiceId: "1000051"
    }
    completeMessage: 'Thank you for buying our product!'
  });

  document.getElementById('pay-now-button').addEventListener('click', function(e) {
    handler.open();
    e.preventDefault();
  });

  // Close Modal on page navigation:
  window.addEventListener('popstate', function() {
    handler.close();
  });
</script>
```

Pay with Token Markets&trade; or "Instant Invoices" is a feature that allows for generic bitcoin/token/credit payment collection on any website or app.
This is similar to instant checkout functionality on Stripe or Paypal.

**Note:** A default bitcoin forwarding address must be set up in order to accept bitcoin or token payments.  
Stripe Connect required for credit cards. See your [Markets Settings](https://tokenmarkets.com/account/edit) for account configuration.

For pricing, refer to "standard item" invoice pricing on your Markets dashboard.

For front end implementation, refer to our javascript SDK and PHP API documentation below.

