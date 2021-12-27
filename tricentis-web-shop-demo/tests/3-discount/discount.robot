*** Settings ***
Documentation  Perform a purchase order with a discount code
Library  Browser
Resource  ../../resources/common-variables/user_info.robot
Resource  ../../resources/common-keywords/common_keywords.robot
Test Setup  Log In
Test Teardown  Close Webshop

*** Variables ***
${discount_code}  AutomationDiscount2
${sum_total_pre_discount}

*** Test Cases ***
Add products and test discount code functionality
    Add Products And Navigate To Cart
    Check Order Price Without Discount
    Apply Discount And Check Discount State

*** Keywords ***
Add Products And Navigate To Cart
    Click  (//div[contains(@class, "product-grid")]//h2//a)[2]
    Click  //*[contains(@id,"add-to-cart-button-")]
    Go Back
    Click  (//div[contains(@class, "product-grid")]//h2//a)[3]
    Click  //*[contains(@id,"add-to-cart-button-")]
    Click  //li[@id="topcartlink"]/a[@href="/cart"]

Check Order Price Without Discount
    # Go through prices of each item in cart
    ${units}  Get Elements  //span[@class="product-subtotal"]
    # Add them together
    FOR  ${unit}  IN  @{units}
      ${price}  Get Property  ${unit}  innerText
      ${sum_total_pre_discount}  Evaluate  ${sum_total_pre_discount}+${price}
    END
    ${sub_total}    Get Property  (//span[@class="product-price"])[1]  innerText
    ${shipping_cost}    Get Property  (//span[@class="product-price"])[2]  innerText
    ${tax}    Get Property  (//span[@class="product-price"])[3]  innerText
    # Check that the sum corresponds to sub-total
    Should Be Equal As Numbers  ${sum_total_pre_discount}  ${sub_total}
    # Add shipping and tax to sub-total
    ${sub_total}  Evaluate  ${sub_total}+${shipping_cost}+${tax}
    ${sum_total_pre_discount}  Evaluate  ${sum_total_pre_discount}+${shipping_cost}+${tax}
    # Check that the total corresponds to sub-total with shipping and tax
    Should Be Equal As Numbers  ${sum_total_pre_discount}  ${sub_total}
    ${sum_total_pre_discount}  Set Test Variable  ${sum_total_pre_discount}

Apply Discount And Check Discount State
    Fill Text  //input[@class="discount-coupon-code"]  ${discount_code}
    Click  //input[@name="applydiscountcouponcode"]
    Get Element State  //div[@class="message"]  visible  ==  True
    Get Property  //div[@class="message"]  innerText  ==  The coupon code was applied
    Get Element State  //input[@name="removeordertotaldiscount"]  visible  ==  True
    ${discount_amount}  Get Property  //input[@name="removeordertotaldiscount"]/../../..//span[@class="product-price"]  innerText
    ${new_total}  Get Property  //span[@class="product-price order-total"]  innerText
    ${old_total_reduced_with_discount}  Evaluate  ${sum_total_pre_discount}+${discount_amount}
    Should Be Equal As Numbers  ${new_total}  ${old_total_reduced_with_discount}
