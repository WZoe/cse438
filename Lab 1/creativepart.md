# Features

- Calculation Result History handily keeps the records;
- Built-in rough Currency Converter between USD$ and CNY¥;
- Discount stepper for easy alteration;
- Decimal number pad;
- Clear Button for text fields;
- Default sales tax rate in MO;
- Stylish UI Design.

## Calculation Result History

![image-20190910193828008](/Users/wangziyi/Library/Application Support/typora-user-images/image-20190910193828008.png)

### What

Everytime you edit the input and a calculation is done, a record of the result is created at the top of History. Dismiss the keyboard to view this feature fully.

### How

I implemented it by adding a label text area which links to an outlet in the code. Whenever the Final Price changes (in my code, whenever the calculation function is called), the content updates itself and is reflected on the screen through the outlet.

### Why

With this History records, users can track their previous inputs and outcomes easily so they won't need an extra note to memorize the results for later reference.

## Built-in Currency Converter 

![image-20190910194735799](/Users/wangziyi/Library/Application Support/typora-user-images/image-20190910194735799.png)

### What

This built-in Currency Converter helps you switch the money between USD$ and CNY¥ with just one click. It gives a rough result straight on the Final Price area.

### How

I added a segmented control object and an action to monitor the state of the Converter. With the value of the segment tag changing, it triggers the currency converting function to calculate the new result in different currencies.

### Why

I suppose this feature could be handy for foreigners who use two or more currencies to shop like me. The reason I chose segemented control over switch was with segments there could be more currency choices added to the feature later.