#include <iostream>

using namespace std;

int takeComplement(int num) {
    return ~num;
}

int raise(int num, unsigned int pow) {
    
    switch(pow) {
        case 0:
            return 1;
        case 1:
            return num;
        default:
            return num * raise(num, pow - 1);
    }
}

int main() {
    int toNegate;
    cout << "Number to negate: ";
    cin >> toNegate;
    cout << toNegate << " negated is " << takeComplement(toNegate) << endl << endl;
    int toRaise;
    int power;
    cout << "Number to raise: ";
    cin >> toRaise;
    cout << "Power: ";
    cin >> power;
    cout << toRaise << " to the power of " << power << " is " << raise(toRaise, power) << endl;
    return 0;
}