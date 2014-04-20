package com.social.calc

import grails.converters.JSON

import java.text.DecimalFormat

/**
 * Created by hitenpratap on 19/4/14.
 */
class SocialCalcController {

    def index={
        List<CalculatorData> feeds = CalculatorData.createCriteria().list {
            order('dateCreated',ORDER_DESCENDING)
            setMaxResults(10)
        }
        String myIpAddr = Util.getUserIpAddress(request)
        [feeds:feeds,myIpAddr:myIpAddr]
    }

    def ax_saveCalcResult={
        def result = [:]
        CalculatorData calculatorData = new CalculatorData()
        DecimalFormat df = new DecimalFormat("###.##");
        calculatorData.firstOperand = params.double('operand1')
        calculatorData.secondOperand = params.double('operand2')
        calculatorData.operator = params.operator
        calculatorData.resultCalc = Math.round(params.double('resultCalc'))
        calculatorData.iPAddress = Util.getUserIpAddress(request)
        if(calculatorData.validate()){
            result.result = 'SUCCESS'
            result.calcResult = calculatorData.resultCalc
            calculatorData.save(flush: true)
        }else {
            result.result = 'FAILURE'
        }

        render result as JSON
    }


    def ax_renderLiveFeed={
        def result = [:]
        String myIpAddr = Util.getUserIpAddress(request)
        List<CalculatorData> feeds = CalculatorData.createCriteria().list {
            order('dateCreated',ORDER_DESCENDING)
            setMaxResults(10)
        }
        if(!feeds){
            result.result = 'FAILURE'
        }else{
            result.result = 'SUCCESS'
            result.feedData = "${g.render(template: '/socialCalc/liveFeed',model: [feeds:feeds,myIpAddr: myIpAddr])}"
        }
        render result as JSON
    }

    def ax_remotePagination={
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        String myIpAddr = Util.getUserIpAddress(request)
        List<CalculatorData> feeds = CalculatorData.createCriteria().list(params) {
            order('dateCreated',ORDER_DESCENDING)
        }
        render(template: 'liveFeed', model: [feeds: feeds, resultCalcTotal: CalculatorData.count(),myIpAddr: myIpAddr])
    }

}
