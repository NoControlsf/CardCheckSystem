
package com.ccs.test;

/**
 * Created by NoControl on 2018/3/16.
 */

class Vehicle{
    public void drive(){
        System.out.println("Vehicle:drive");
    }
}
class Car extends Vehicle{
    public void drive(){
        System.out.println("Car:drive");
    }
}

public class test1 {
    public static void main(String args[]){
        Vehicle v;
        Car c;
        v = new Vehicle();
        c = new Car();
        v.drive();
        c.drive();
        v = c;
        v.drive();
    }
}
