%{--<div class="row" style="border:2px solid;border-radius:15px;padding: 1%">--}%



%{--</div>--}%
<div class="alert alert-danger errorsTxt">
    <p class="text-danger text-center errorsTxt" style="display: none"></p>
</div>


<h2 class="col-lg-offset-3">Your Calculator</h2>

<form class="form-horizontal col-lg-offset-3" role="form" name="socialCalcForm" id="socialCalcForm">
    <input type="hidden" name="operand1" id="operand1"/>
    <input type="hidden" name="operand2" id="operand2"/>
    <input type="hidden" name="operator" id="operator"/>
    <input type="hidden" name="resultCalc" id="resultCalc"/>

    <div class="form-group">
        <div class="col-sm-6">
            <input type="text" name="calcDisplay" class="form-control input-lg text-right" id="calcDisplay"
                   placeholder="0">
            <img id="resultLoader" src="${resource(dir: 'images', file: 'loader.gif')}"
                 style="margin-top: -17%;margin-left: 89%;position: absolute;display: none"/>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-6">
            <input class="btn btn-warning btn-lg col-xs-5 clearDisplay" type="button" value="C">
            <input class="btn btn-danger btn-lg col-lg-offset-1 col-xs-6 backSpaceBtn" type="button" value="<--">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-6">
            <input class="btn btn-default btn-lg inputNum" type="button" value="7">
            <input class="btn btn-default btn-lg inputNum" type="button" value="8">
            <input class="btn btn-default btn-lg inputNum" type="button" value="9">
            <input class="btn btn-default btn-lg inputOperator" type="button" value="+">
        </div>
    </div>

    <div class="  form-group">
        <div class="col-sm-6">
            <input class="btn btn-default btn-lg inputNum" type="button" value="4">
            <input class="btn btn-default btn-lg inputNum" type="button" value="5">
            <input class="btn btn-default btn-lg inputNum" type="button" value="6">
            <input class="btn btn-default btn-lg inputOperator" type="button" value="-">
        </div>
    </div>

    <div class=" form-group">
        <div class="col-sm-6">
            <input class="btn btn-default btn-lg inputNum" type="button" value="1">
            <input class="btn btn-default btn-lg inputNum" type="button" value="2">
            <input class="btn btn-default btn-lg inputNum" type="button" value="3">
            <input class="btn btn-default btn-lg inputOperator" type="button" value="*">
        </div>
    </div>

    <div class=" form-group">
        <div class="col-sm-6">
            <input class="btn btn-default btn-lg inputNum" type="button" value="0">
            <input class="btn btn-default btn-lg inputNum" type="button" value=".">
            <input class="btn btn-default btn-lg inputOperator" type="button" value="/">
            <input class="btn btn-success btn-lg inputEqlsBtn" type="button" value="=">
        </div>
    </div>
</form>


<script>

    $(".clearDisplay").click(function () {
        $("#calcDisplay").val('');
    });

    $(".backSpaceBtn").click(function () {
        if ($("#calcDisplay").val() == '') {
            $("#calcDisplay").val('');
        }
        else {
            $("#calcDisplay").val($("#calcDisplay").val().slice(0, -1));
        }
    });

    $(".inputNum").click(function () {
        $(".errorsTxt").css('display', 'none');
        if ($("#resultCalc").val() != '') {
            initialiseCalc();
            if ($("#calcDisplay").val() != '') {
                $("#calcDisplay").val($("#calcDisplay").val() + $(this).val());
            } else {
                $("#calcDisplay").val($(this).val());
            }
        } else {
            if ($("#calcDisplay").val() != '') {
                $("#calcDisplay").val($("#calcDisplay").val() + $(this).val());
            } else {
                $("#calcDisplay").val($(this).val());
            }
        }
    });

    $(".inputOperator").click(function () {
        $(".errorsTxt").css('display', 'none');
        $("#operand1").val($("#calcDisplay").val());
        $("#calcDisplay").val('');
        $("#operator").val($(this).val());
    });

    $(".inputEqlsBtn").click(function () {
        $(".errorsTxt").css('display', 'none');
        if ($("#operand1").val() != '' && $("#operator").val() != '' && $("#calcDisplay").val() != '') {
            $("#operand2").val($("#calcDisplay").val());
            $("#calcDisplay").val('');
            $("#resultLoader").css('display', '');
            displayResult();
            $("#resultLoader").css('display', 'none');
            $("#calcDisplay").val($("#resultCalc").val());
            displayLiveFeed();
        } else {
            $(".errorsTxt").css('display', '');
            $(".errorsTxt").text('Please perform full operation on two operands.')
        }
    });

    function initialiseCalc() {
        $("#resultCalc").val('');
        $("#calcDisplay").val('');
        clearHiddenFields();
    }

    function clearHiddenFields() {
        $("#operand1").val('');
        $("#operand2").val('');
        $("#operator").val('');
    }

    function displayResult() {
        var operand1 = parseFloat($("#operand1").val());
        var operand2 = parseFloat($("#operand2").val());
        var operator = $("#operator").val();
        if (operand1 && operand2 && operator) {
            switch (operator) {
                case '+':
                    $("#resultCalc").val(operand1 + operand2);
                    break;
                case '-':
                    $("#resultCalc").val(operand1 - operand2);
                    break;
                case '*':
                    $("#resultCalc").val(operand1 * operand2);
                    break;
                case '/':
                    $("#resultCalc").val(operand1 / operand2);
                    break;
            }
            saveCalcResult();
        }
        else {
            $(".errorsTxt").css('display', '');
            $(".errorsTxt").text('Please perform full operation on two operands.');
        }
    }

    function saveCalcResult() {
        var operand1 = parseFloat($("#operand1").val());
        var operand2 = parseFloat($("#operand2").val());
        var operator = $("#operator").val();
        var resultCalc = $("#resultCalc").val();

        <g:remoteFunction controller="socialCalc" action="ax_saveCalcResult" onFailure="errorSaveCalcResult()" onSuccess="successSaveCalcResult(data)" params="{operand1:operand1,operand2:operand2,operator:operator,resultCalc:resultCalc}" />
    }

    function successSaveCalcResult(data) {
        if (data.result && data.result == 'SUCCESS') {
            clearHiddenFields();
        } else {
            clearHiddenFields();
            $(".errorsTxt").css('display', '');
            $(".errorsTxt").text('Something went wrong with just performed operation. Please try again.');
        }
    }

    function errorSaveCalcResult(){
        $(".errorsTxt").css('display', '');
        $(".errorsTxt").text('Something went wrong with just performed operation. Please try again.')
    }

</script>