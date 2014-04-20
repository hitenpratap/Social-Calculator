<%@ page import="com.social.calc.CalculatorData" %>
<div id="resultCalcFeed">
    <g:if test="${feeds}">
        <table class="table table-bordered table-responsive" style="font-family: Ubuntu">
            <tbody>
            <g:each in="${feeds}" var="feed">

                <tr>
                    <td>${feed?.firstOperand} ${feed?.operator} ${feed?.secondOperand} = ${feed?.resultCalc}</td>
                    <td>(ip ${feed?.iPAddress},  <g:formatDate
                            date="${feed?.dateCreated}" type="time" style="SHORT"/>)</td>
                    <td><span
                            class="badge">${feed?.iPAddress?.equals(myIpAddr) ? 'My calc result' : 'Other user\'s calc result'}</span>
                    </td>
                </tr>

            </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <p class="text-warning">
            There is nothing to display here now. Please wait some time or perform some operations to see them here.
        </p>
    </g:else>
</div>

<div class="paginateButtons">
    <util:remotePaginate total="${CalculatorData.count}" update="liveFeeds" controller="socialCalc"
                         action="ax_remotePagination"/>
</div>

<script>
    $(".currentStep").addClass('label label-success').after(" ");
    $(".step").addClass('label label-primary').after(" ");
    $(".nextLink").addClass('label label-default').after(" ");
    $(".prevLink").addClass('label label-default').after(" ");
</script>