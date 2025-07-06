import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DefiBank{
    stable var currentValue: Float = 300;
    // currentValue := 100; //would change

    stable var startTime = Time.now()
    Debug.print(debug_show(startTime));

    let id = 8485878847; //won't change

    // Debug.print(debug_show(currentValue));

    public func topUp(amount: Float){
        currentValue += amount;
        Debug.print(debug_show(currentValue));
    };
    //topUp();

    public func withdrawl(amount: Float){
        let tempValue: Float = currentValue - amount;
        if (tempValue - amount >= 0){
        currentValue -= amount;
        Debug.print(debug_show(currentValue));
    }else{
        Debug.print("Amount too large, currentValue less than zero")
    }
    };

    public query func checkBalance(): async Float{
        return currentValue;
    }

    public func compound(){
        let currentTime = Time.now();
        let timeElapsedNS = currentTime - startTime;
        let timeElapsedS = timeElapsedNS / 1000000000;
        currentValue:= currentValue * (1.01 ** Float.frontInt(timeElapsedS));
        startTime := currentTime;
    }
}
