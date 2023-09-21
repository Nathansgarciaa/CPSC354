#include <iostream>
#include <sstream>
#include <string>

using namespace std;

int main() {
    int userNum;
    const int constant = 2;
    string userInput;

    cout << "Enter an integer: ";
    getline(cin, userInput);

    stringstream userStream(userInput);
    userStream >> userNum;

    if (!userStream) {
        cout << "Invalid input. Please enter an integer." << endl;
        return 1; 
    }

    cout << "Sum: " << userNum + constant << endl;
    cout << "Difference: " << userNum - constant << endl;
    cout << "Product: " << constant * userNum << endl;

    if (constant != 0) {
        cout << "Quotient: " << userNum / constant << endl;
    } else {
        cout << "Division by zero is not allowed." << endl;
    }

    return 0;
}
