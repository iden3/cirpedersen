include "../mux1.circom";
include "../../../bitify/num2bits/num2bits.circom";

template Constants() {
    var i;
    signal output out[2];

    out[0] <== 37;
    out[1] <== 47;
}

template Main() {
    var i;
    signal private input selector;
    signal output out;

    component mux = Mux1();
    component n2b = Num2Bits(1);
    component cst = Constants();

    selector ==> n2b.in; // TODO: why?
    n2b.out[0] ==> mux.s;
    for (i=0; i<2; i++) {
        cst.out[i] ==> mux.c[i];
    }

    mux.out ==> out;
}

component main = Main();
