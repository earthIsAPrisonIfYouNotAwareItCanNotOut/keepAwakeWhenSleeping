/*
   use third party callback
*/

analytics.trackPurchase( purchaseData, function(){
        chargeCreditCard();
        displayThankyouPage();
} );


/*
   invent a lot of ad hoc logic to a utility you can not trust

   there is a troubling list for this ad hoc logic
     Call the callback too early (before it's been tracked)
     Call the callback too late (or never)
     Call the callback too few or too many times (like the problem you encountered!)
     Fail to pass along any necessary environment/parameters to your callback
     Swallow any errors/exceptions that may happen
*/

var tracked = false;

analytics.trackPurchase( purchaseData, function(){
        if (!tracked) {
                tracked = true;
                chargeCreditCard();
                displayThankyouPage();
        }
} );
