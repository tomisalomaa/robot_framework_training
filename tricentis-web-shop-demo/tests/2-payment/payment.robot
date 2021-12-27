*** Settings ***
Documentation  Add items to cart and proceed to order
Library  Browser
Library  Collections
Resource  ../../resources/common-variables/user_info.robot
Resource  ../../resources/common-keywords/common_keywords.robot
Test Teardown  Close Webshop

*** Test Cases ***
Place products to cart complete purchase
    New Page  ${webshop_url}
    Log In
    Add Products And Navigate To Cart
    Check Total Price And Proceed To Checkout
    Check Billing Info
    Check Shipping Address
    Check Shipping Method
    Check Payment Method
    Check Payment Information
    Confirm Purchase

*** Keywords ***
Log In
    Click  //a[@class="ico-login"]
    Fill Text  id=Email  ${email}
    Fill Text  id=Password  ${password}
    Click  //input[@value="Log in"]
    Get Property  //div[@class="header-links"]//a[@class="account"]
    ...  innerText  ==  ${email}

Add Products And Navigate To Cart
    Click  (//div[contains(@class, "product-grid")]//h2//a)[2]
    Click  //*[contains(@id,"add-to-cart-button-")]
    Go Back
    Click  (//div[contains(@class, "product-grid")]//h2//a)[3]
    Click  //*[contains(@id,"add-to-cart-button-")]
    Click  //li[@id="topcartlink"]/a[@href="/cart"]

Check Total Price And Proceed To Checkout
    # Go through prices of each item in cart
    ${sum_total}  Set Variable  0
    ${units}  Get Elements  //span[@class="product-subtotal"]
    # Add them together
    FOR  ${unit}  IN  @{units}
      ${price}  Get Property  ${unit}  innerText
      ${sum_total}  Evaluate  ${sum_total}+${price}
    END
    ${sub_total}    Get Property  (//span[@class="product-price"])[1]  innerText
    ${shipping_cost}    Get Property  (//span[@class="product-price"])[2]  innerText
    ${tax}    Get Property  (//span[@class="product-price"])[3]  innerText
    # Check that the sum corresponds to sub-total
    Should Be Equal As Numbers  ${sum_total}  ${sub_total}
    # Add shipping and tax to sub-total
    ${sub_total}  Evaluate  ${sub_total}+${shipping_cost}+${tax}
    ${sum_total}  Evaluate  ${sum_total}+${shipping_cost}+${tax}
    # Check that the total corresponds to sub-total with shipping and tax
    Should Be Equal As Numbers  ${sum_total}  ${sub_total}
    # Proceed to checkout
    Check Checkbox  id=termsofservice
    Click  id=checkout

Check Billing Info
    ${billing_info_available}  Get Property  //select[@id="billing-address-select"]  innerText
    Log  ${billing_info_available}
    IF  """${billing_info_available}""" != "New Address"
      Click  //input[@onClick="Billing.save()"]
    ELSE
      Fill Billing Info
    END

Fill Billing Info
    ${prefilled_first_name}  Get Property  id=BillingNewAddress_FirstName  value
    ${prefilled_last_name}  Get Property  id=BillingNewAddress_LastName  value
    ${prefilled_email}  Get Property  id=BillingNewAddress_Email  value
    Should Not Be Empty  ${prefilled_first_name}
    Log  First name: ${prefilled_first_name}
    Should Not Be Empty  ${prefilled_last_name}
    Log  Last name: ${prefilled_last_name}
    Should Be Equal As Strings  ${prefilled_email}  ${email}
    Log  Email: ${prefilled_email}
    Select Options By  select[id=BillingNewAddress_CountryId]  text  ${country}
    Fill Text  id=BillingNewAddress_City  ${city}
    Fill Text  id=BillingNewAddress_Address1  ${address}
    Fill Text  id=BillingNewAddress_ZipPostalCode  ${zip}
    Fill Text  id=BillingNewAddress_PhoneNumber  ${phone}
    Click  //input[@onClick="Billing.save()"]

Check Shipping Address
    Wait For Elements State  id=shipping-addresses-form  visible
    ${current_shipping_address}  Get Property  id=shipping-address-select  innerText
    Should Not Be Equal As Strings  ${current_shipping_address}  New Address
    Click  //input[@onClick="Shipping.save()"]

Check Shipping Method
    Wait For Elements State  id=co-shipping-method-form  visible
    Get Checkbox State  id=shippingoption_0  ==  checked
    Click  //input[@onClick="ShippingMethod.save()"]

Check Payment Method
    Wait For Elements State  id=co-payment-method-form  visible
    Get Checkbox State  id=paymentmethod_0  ==  checked
    Click  //input[@onClick="PaymentMethod.save()"]

Check Payment Information
    ${payment_info}  Get Property  //div[@class="info"]  innerText
    Should Be Equal As Strings  ${payment_info}  You will pay by COD
    Click  //input[@onClick="PaymentInfo.save()"]

Confirm Purchase
    Click  //input[@onClick="ConfirmOrder.save()"]
    Wait For Navigation  http://demowebshop.tricentis.com/checkout/completed/
    Take Screenshot