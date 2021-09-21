> _<x>:=PolynomialRing(Rationals());
> PS:=ProjectiveSpace(Rationals(),1);
> K<t>:=NumberField(x^5-3);
> _<X>:=PolynomialRing(K);
> OK:=MaximalOrder(K); Basis(OK,NumberField(OK));
[
    1,
    t,
    t^2,
    t^3,
    t^4
> e1:=t^3 + t^2 - t - 2;
> e2:=t^4 + 2*t + 4;
> [Norm(e1),Norm(e2)];
[ 1, 1 ]
> u1:=1; u2:=e1; u3:=e2; u4:=e1*e2;
> g:=1;
> u:=u1; C1:=HyperellipticCurve(u/g*(X^4-t^4*X^3+3*t^3*X^2-9*t^2*X+27*t));
> u:=u2; C2:=HyperellipticCurve(u/g*(X^4-t^4*X^3+3*t^3*X^2-9*t^2*X+27*t));
> u:=u3; C3:=HyperellipticCurve(u/g*(X^4-t^4*X^3+3*t^3*X^2-9*t^2*X+27*t));
> u:=u4; C4:=HyperellipticCurve(u/g*(X^4-t^4*X^3+3*t^3*X^2-9*t^2*X+27*t));
> 
> rp1:=RationalPoints(C1: Bound:=10);
> rp2:=RationalPoints(C2: Bound:=10);
> rp3:=RationalPoints(C3: Bound:=10);
> rp4:=RationalPoints(C4: Bound:=10);
> 
> E1,C1toE1:=EllipticCurve(C1,C1!rp1[1]);
> E2,C2toE2:=EllipticCurve(C2,C2!rp2[1]);
> E3,C3toE3:=EllipticCurve(C3,C3!rp3[1]);
> E4,C4toE4:=EllipticCurve(C4,C4![1/4*(t^4+3*t^3-3*t^2+3*t-3), 1/16*(-51*t^4+3\
9*t^3+117*t^2+63*t-99)]);
>
> C1toPS := map<C1->PS | [C1.1, C1.3]>;
> C2toPS := map<C2->PS | [C2.1, C2.3]>;
> C3toPS := map<C3->PS | [C3.1, C3.3]>;
> C4toPS := map<C4->PS | [C4.1, C4.3]>;
> 
> E1toPS:=Expand(Inverse(C1toE1)*C1toPS);
> E2toPS:=Expand(Inverse(C2toE2)*C2toPS);
> E3toPS:=Expand(Inverse(C3toE3)*C3toPS);
> E4toPS:=Expand(Inverse(C4toE4)*C4toPS);
> time b1,G1,m1 := PseudoMordellWeilGroup(E1: SearchBound:=20); b1;
Time: 30.060
true
> 
> F2,E2toF2:=MinimalModel(E2);
> F2toPS:=Expand(Inverse(E2toF2)*E2toPS);
> time b2,G2,m2 := PseudoMordellWeilGroup(F2: SearchBound:=20); b2;
Time: 9.770
true
> 
> time b3,G3,m3 := PseudoMordellWeilGroup(E3: SearchBound:=20); b3;
Time: 145.490
true
> 
> time b4,G4,m4 := PseudoMordellWeilGroup(E4: SearchBound:=20); b4;
Time: 78.540
true
>
> time N1,V1,R1,W1:=Chabauty(m1,E1toPS,7);  [N1,#V1]; R1;
Time: 0.330
[ 4, 4 ]
4
> time N2,V2,R2,W2:=Chabauty(m2,F2toPS,11); [N2,#V2]; R2;
Time: 265.920
[ 2, 2 ]
4
> time N3,V3,R3,W3:=Chabauty(m3,E3toPS,11); [N3,#V3]; R3;
Time: 1387.240
[ 0, 0 ]
2
> time N4,V4,R4,W4:=Chabauty(m4,E4toPS,11); [N4,#V4]; R4;
Time: 4.390
[ 4, 4 ]
2
> [EvaluateByPowerSeries(E1toPS, m1(v)): v in V1];
[ (1 : 0), (1 : 0), (0 : 1), (0 : 1) ]
> [EvaluateByPowerSeries(F2toPS, m2(v)): v in V2];
[ (-2 : 1), (-2 : 1) ]
> [EvaluateByPowerSeries(E3toPS, m3(v)): v in V3];
[]
> [EvaluateByPowerSeries(E4toPS, m4(v)): v in V4];
[ (-1 : 1), (3 : 1), (3 : 1), (-1 : 1) ]
> quit;
