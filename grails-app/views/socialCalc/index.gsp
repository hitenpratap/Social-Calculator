<%--
  Created by IntelliJ IDEA.
  User: hitenpratap
  Date: 19/4/14
  Time: 9:12 PM
--%>

<%@ page import="com.social.calc.CalculatorData" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Social Calculator</title>
    <style>
    @font-face {
        font-family: 'DS-Digital';
        src: url('${resource(dir: 'fonts',file: 'DS-DIGIB.TTF')}');
    }
        #calcDisplay{
            font-family: DS-Digital;
            font-size: xx-large;
        }

    </style>
</head>

<body>
<div class="container">

    <div class="row">
        <div class="col-lg-6">
            <g:render template="/socialCalc/calculatorBody"/>
        </div>


        <div class="col-lg-6">
            <h3 class="text-danger">live calc feed from top-down</h3>
            <a href="javascript:void(0)" id="refreshLiveFeed"><img src="${resource(dir: 'images',file: '1397960357_view-refresh.png')}"
                                              style="margin-top: -6%;margin-left: 51%;position: absolute;"/></a>

            <div id="liveFeeds">
                <g:render template="liveFeed" model="[feeds: feeds,myIpAddr:myIpAddr]"/>
            </div>
        </div>
    </div>

</div>

<script>
    $(document).ready(function(){
        setInterval(function () {
            displayLiveFeed();
        },30000);

        $(".errorsTxt").css('display', 'none');
        $(".currentStep").addClass('label label-success').after(" ");
        $(".step").addClass('label label-primary').after(" ");
        $(".nextLink").addClass('label label-default').after(" ");
        $(".prevLink").addClass('label label-default').after(" ");

    });

    $("#refreshLiveFeed").click(function(){
        displayLiveFeed();
    });

    function displayLiveFeed() {
        <g:remoteFunction controller="socialCalc" onSuccess="successDisplayFeed(data)" onFailure="errorDisplayFeed()" action="ax_renderLiveFeed" />
    }

    function successDisplayFeed(result) {
        if(result.result=='SUCCESS'){
            $("#liveFeeds").html(result.feedData);
            $("#liveFeeds").effect("highlight");
        }else{
            $(".errorsTxt").css('display', '');
            $(".errorsTxt").text('Something went wrong with just performed operation. Please try again.')
        }
    }

    function errorDisplayFeed(){
        $(".errorsTxt").css('display', '');
        $(".errorsTxt").text('Something went wrong with just performed operation. Please try again.')
    }
</script>

</body>
</html>