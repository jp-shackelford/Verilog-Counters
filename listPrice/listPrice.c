//  preprocessor directive to support printing to the display
#include <stdio.h>

void getInfo(float* PTRprice, float* PTRmarkUp, float* PTRtax, float* PTRdiscount);

float calcPrice (float price, float markUp, float tax, float discount);

//  the main program
int main(void)
{
	//  declare, define, and initialize some working variables
	float price;
	float markUp;
	float tax;
	float discount;

	float  listPrice;

	getInfo(&price, &markUp, &tax, &discount);

	listPrice = calcPrice(price, markUp, tax, discount);

	//  ask the user for some data
	printf("The final price, with tax, will be: %0.2f\n", listPrice);

	return 0;
}

void getInfo(float* PTRprice, float* PTRmarkUp, float* PTRtax, float* PTRdiscount) {
    printf("**Enter all the following data in decimal form**\n");
    printf("Please enter the Manufacturer's Price (number): \n\t");
    scanf("%f", PTRprice);
    printf("Please enter the Dealer's Mark Up (percentage): \n\t");
    scanf("%f", PTRmarkUp);
    printf("Please enter the Local Sales Tax (percentage): \n\t");
    scanf("%f", PTRtax);
    printf("Please enter the Expected Discount (percentage): \n\t");
    scanf("%f", PTRdiscount);
}

float calcPrice(float price, float markUp, float tax, float discount) {
    float listPrice;

    float dealerPrice = price + price * markUp;

    printf("After dealer mark up: %0.2f\n\n", dealerPrice);

    float preTax = dealerPrice - price*discount;

    printf("After dealer discount, but before taxes: %0.2f\n\n", preTax);

    listPrice = preTax + (preTax)*tax;

    return listPrice;
}

