package com.social.calc

/**
 * Created by hitenpratap on 19/4/14.
 */
class CalculatorData {

    Double firstOperand
    Double secondOperand
    String operator
    Double resultCalc
    String iPAddress
    Date dateCreated

    static constraints = {
        firstOperand nullable: false
        secondOperand nullable: false
        operator blank: false, nullable: false
        resultCalc nullable: false
        iPAddress nullable: false
    }

}
