import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
// dfx new dbank
// cd dbank 
// dfx start

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 100; assign value


  // let = constant
  // var = variable 
  stable var startTime = Time.now();

  let id = 123213214421321;

  public func deposit(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };


  // topUp();
  // dfx deploy
  // dfx canister call dbank topUp

  // dfx canister id __Candid_UI
  // 127.0.0.1:8000/?canisterId=<above>
  // dfx canister id dbank
  // enter id


  public func withdraw(amount: Float){
    if(amount > currentValue ){
      Debug.print("cannot withdraw more than current value");
      return;
    };
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    Debug.print(debug_show(timeElapsedS));
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }

}