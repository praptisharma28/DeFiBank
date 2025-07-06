import Debug "mo:base/Debug";

actor DefiBank{
    var currentValue = 300;
    currentValue := 100; //would change

    let id = 8485878847; //won't change

    // Debug.print(debug_show(currentValue));

    public func topUp(amount: Nat){
        currentValue += amount;
        Debug.print(debug_show(currentValue));
    };
    //topUp();

    public func withdrawl(amount: Nat){
        let tempValue: Int = currentValue - amount;
        if (tempValue - amount >= 0){
        currentValue -= amount;
        Debug.print(debug_show(currentValue));
    }else{
        Debug.print("Amount too large, currentValue less than zero")
    }
    };

    public query func checkBalance(): async Nat{
        return currentValue;
}
