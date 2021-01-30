#include <bits/stdc++.h>
using namespace std;

string toBinary(int x){
    string binary;
    vector<int> binaryNum;
    while (x> 0) binaryNum.push_back(x % 2) , x/= 2;
    for (int i =binaryNum.size()-1; i>= 0; i--) binary +=binaryNum[i] + '0';
    return binary;
}

string HexToBin(string s){
    string hex;
    for(auto c:s) {
        switch (toupper(c)) {
            case '0': hex+= "0000"; break;
            case '1': hex+= "0001"; break;
            case '2': hex+= "0010"; break;
            case '3': hex+= "0011"; break;
            case '4': hex+= "0100"; break;
            case '5': hex+= "0101"; break;
            case '6': hex+= "0110"; break;
            case '7': hex+= "0111"; break;
            case '8': hex+= "1000"; break;
            case '9': hex+= "1001"; break;
            case 'A': hex+= "1010"; break;
            case 'B': hex+= "1011"; break;
            case 'C': hex+= "1100"; break;
            case 'D': hex+= "1101"; break;
            case 'E': hex+= "1110"; break;
            case 'F': hex+= "1111"; break;
        }
    }
    return hex;
}

string FoundDigit(string s){
    string bin;
    if(toupper(s[s.size()-1]) == 'H') bin += HexToBin(s);
    else {
        int ImmediateSz = 16 - toBinary(stoi(s)).size();
        while (ImmediateSz--) bin += '0';
        bin += toBinary(stoi(s));
    }
    return bin;
}

string FoundRegister (string s){
    string reg, bin;
    for (auto c : s) if (isdigit(c)) reg += c;
    int RegSz = 5 - toBinary(stoi(reg)).size();
    while (RegSz--) bin += '0';
    bin += toBinary(stoi(reg));
    return bin;
}

int main()
{
    ifstream inFile;
    ofstream outFile;
    inFile.open("C:\\Users\\Ahmedwael255\\Desktop\\Test.txt");
    outFile.open("C:\\Users\\Ahmedwael255\\Desktop\\outtest.txt");

    string S, str;
    while(getline(inFile, S)) {
        string bin;
        stringstream X(S);
        bool ALUFlag = 0, MOVFlag = 0, CMPIFlag = 0;
        while (getline(X, str, ' ')) {
            str.erase(remove(str.begin(), str.end(), ','), str.end());
            str.erase(remove(str.begin(), str.end(), ';'), str.end());

            //Opcode
            if      (str == "ALU") bin += "000000", ALUFlag = 1;
            else if (str == "BEQ") bin += "000011";
            else if (str ==  "BG") bin += "000100";
            else if (str == "BNE") bin += "000101";
            else if (str ==  "BS") bin += "000110";
            else if (str ==  "LW") bin += "00011100000";
            else if (str =="MOVI") bin += "00100000000";
            else if (str ==  "SW") bin += "00101000000";
            else if (str ==   "J") bin += "001011000000000000000000000";
            else if (str == "Jal") bin += "001100000000000000000000000";
            else if (str == "JNZ") bin += "001101000000000000000000000";
            else if (str ==  "JR") bin += "001110";
            else if (str ==  "JZ") bin += "001111000000000000000000000";
            else if (str ==  "IN") bin += "01000000000";
            else if (str == "MOV") bin += "010001", MOVFlag = 1;
            else if (str == "OUT") bin += "010010";
            else if (str == "POP") bin += "01001100000";
            else if (str =="PUSH") bin += "010100";
            else if (str == "HLT") bin += "010101";
            else if (str == "NOP") bin += "010111";
            else if (str == "CMP") bin += "011001";
            else if (str =="CMPI") bin += "011010", CMPIFlag = 1;

                //ALU Functions
            else if (str == "ADD") bin += "00000000000";
            else if (str == "SUB") bin += "00000000001";
            else if (str == "INC") bin += "00000000010";
            else if (str == "DEC") bin += "00000000011";
            else if (str == "SHL") bin += "00000000100";
            else if (str == "SHR") bin += "00000000101";
            else if (str == "ROL") bin += "00000000110";
            else if (str == "ROR") bin += "00000000111";
            else if (str == "AND") bin += "00000001000";
            else if (str == "OR" ) bin += "00000001001";
            else if (str == "XOR") bin += "00000001010";
            else if (str == "NOT") bin += "00000001011";

            else if (str[0] == 'R') bin+=FoundRegister(str); //Registers

            else if (isdigit(str[0]) || toupper(str[str.size()-1]) == 'H') bin += FoundDigit(str); //Offset

            else if(str[0] == '[') bin += HexToBin(str); //Memory Address
        }
        if(bin.size() < 32) while (bin.size()<32) bin += '0';

        if(ALUFlag){
            string rd = bin.substr(6,5); // 011012
            string rs = bin.substr(11,5);
            string rt = bin.substr(16,5);
            bin.replace(6,5,rs);
            bin.replace(11,5,rt);
            bin.replace(16,5,rd);
        }
        else if(CMPIFlag){
            string rt = bin.substr(27,5);
            string imm = bin.substr(11,16);
            bin.replace(11,5,rt);
            bin.replace(16,16,imm);
        }
        else if(MOVFlag){
            string rs = bin.substr(11,5);
            string rt = bin.substr(6,5);
            bin.replace(6,5,rs);
            bin.replace(11,5,rt);
        }
        outFile << bin << endl;
    }
    outFile.close();
    inFile.close();
}