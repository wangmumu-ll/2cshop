<%@ page import="com.digou.pojo.Collection" %><%--
  Created by IntelliJ IDEA.
  User: ζθ
  Date: 18-10-29
  Time: δΈε11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>


<!DOCTYPE html>


<html>

<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/fore/style.css" rel="stylesheet">
    <script>
        function formatMoney(num) {
            num = num.toString().replace(/$|\,/g, '');
            if (isNaN(num))
                num = "0";
            sign = (num == (num = Math.abs(num)));
            num = Math.floor(num * 100 + 0.50000000001);
            cents = num % 100;
            num = Math.floor(num / 100).toString();
            if (cents < 10)
                cents = "0" + cents;
            for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
                num = num.substring(0, num.length - (4 * i + 3)) + ',' +
                    num.substring(num.length - (4 * i + 3));
            return (((sign) ? '' : '-') + num + '.' + cents);
        }

        function checkEmpty(id, name) {
            var value = $("#" + id).val();
            if (value.length == 0) {

                $("#" + id)[0].focus();
                return false;
            }
            return true;
        }


        $(function () {


            $("a.productDetailTopReviewLink").click(function () {
                $("div.productReviewDiv").show();
                $("div.productDetailDiv").hide();
            });
            $("a.productReviewTopPartSelectedLink").click(function () {
                $("div.productReviewDiv").hide();
                $("div.productDetailDiv").show();
            });

            $("span.leaveMessageTextareaSpan").hide();
            $("img.leaveMessageImg").click(function () {

                $(this).hide();
                $("span.leaveMessageTextareaSpan").show();
                $("div.orderItemSumDiv").css("height", "100px");
            });

            $("div#footer a[href$=#nowhere]").click(function () {
                alert("ζ¨‘δ»Ώε°ηηθΏζ₯οΌεΉΆζ²‘ζθ·³θ½¬ε°ε?ιηι‘΅ι’");
            });


            $("a.wangwanglink").click(function () {
                alert("ζ¨‘δ»ΏζΊζΊηεΎζ οΌεΉΆδΈδΌζεΌζΊζΊ");
            });
            $("a.notImplementLink").click(function () {
                alert("θΏδΈͺεθ½ζ²‘εοΌθ€θ€~");
            });


        });

    </script>
</head>

<body>


<nav class="top ">
    <a href="/forehome">
        <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
        ε°ηι¦ι‘΅
    </a>

    <span>ζ¬’θΏζ₯ε°η</span>


    <a href="loginPage">${user.name}</a>
    <a href="forelogout">ιεΊ</a>


    <span class="pull-right">

			<a href="shouCangPage">ζηζΆθ</a>
			<a href="forebought">ζηθ?’ε</a>
			<a href="forecart">
			<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
			θ΄­η©θ½¦<strong>${cartTotalItemNumber}</strong>δ»Ά</a>
    </span>


</nav>


<div>
    <a href="">
        <img id="simpleLogo" class="simpleLogo" src="img/site/simpleLogo.png">
    </a>

    <form action="foresearch" method="post">
        <div class="simpleSearchDiv pull-right">
            <input type="text" placeholder="ζηε?" value="" name="keyword">
            <button class="searchButton" type="submit">ζ₯ζΆθ</button>
            <div class="searchBelow">


            </div>
        </div>
    </form>
    <div style="clear:both"></div>
</div>




<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a orderStatus="all" href="#nowhere">δΊ²γζ¨ηζζζΆθ</a></div>

    </div>
    <div style="clear:both"></div>
    <div class="orderListTitle">
        <table class="orderListTitleTable">

            <tr>
                <td>ε?θ΄</td>
                <td width="100px">εδ»·</td>
                <td width="100px">ζ°ι</td>
                <td width="100px"></td>
                <td width="100px"></td>
            </tr>
        </table>

    </div>

    <div class="orderListItem">
        <%
            int size=-1;
        %>
        <table class="orderListItemTable" orderStatus="waitPay" oid="57">
            <c:forEach items="${collectionList}" var="co" varStatus="cost">
                <c:forEach items="${shoucangPd}" var="p" varStatus="st">
                    <c:if test="${p.id==co.pid}">
                        <tr class="orderListItemFirstTR">
                            <td colspan="2">

                            <%--<span>ζΆθζΆι΄:   <b>2018-10- 14:17:41</b>--%>
                            <%--</span>--%>
                            </td>
                            <td colspan="2"><img width="13px" src="img/site/orderItemTmall.png">ε°ηεεΊ</td>
                            <td colspan="1">
                                    <%--<a class="wangwanglink" href="#nowhere">--%>
                                    <%--<div class="orderItemWangWangGif"></div>--%>
                                    <%--</a>--%>

                            </td>
                            <td class="orderItemDeleteTD">
                                <a class="deleteOrderLink" oid="57" href="shoucangDelete?id=${co.scid}">
                                    <span class="orderListItemDelete glyphicon glyphicon-trash"></span>
                                </a>
                            </td>
                        </tr>

                        <tr class="orderItemProductInfoPartTR">
                            <td class="orderItemProductInfoPartTD"><img width="80" height="80" src="img/productSingle_middle/${p.imageName}"></td>
                            <td class="orderItemProductInfoPartTD">
                                <div class="orderListItemProductLinkOutDiv">
                                    <a href="foreproduct?pid=90">${p.name}</a>
                                    <div class="orderListItemProductLinkInnerDiv">
                                        <img src="img/site/creditcard.png" title="ζ―ζδΏ‘η¨ε‘ζ―δ»">
                                        <img src="img/site/7day.png" title="ζΆθ΄ΉθδΏιζε‘,ζΏθ―Ί7ε€©ιθ΄§">
                                        <img src="img/site/promise.png" title="ζΆθ΄ΉθδΏιζε‘,ζΏθ―Ίε¦ε?ζθΏ°">
                                    </div>
                                </div>
                            </td>
                            <td class="orderItemProductInfoPartTD" width="100px">

                            </td>
                            <td valign="top" rowspan="1" class="orderListItemNumberTD orderItemOrderInfoPartTD" width="100px">
                                <div class="orderListItemProductPrice">οΏ₯${p.promotePrice}</div>
                            </td>
                            <td valign="top" rowspan="1" width="120px" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
                                <span class="orderListItemNumber">1</span>
                            </td>
                            <td valign="top" rowspan="1" class="orderListItemButtonTD orderItemOrderInfoPartTD" width="100px">


                                <a href="foreproduct?pid=${p.id}">
                                    <button class="orderListItemConfirm">εζ¬‘ζ₯η</button>
                                </a>


                            </td>

                        </tr>

                    </c:if>

                </c:forEach>
            </c:forEach>
        </table>

    </div>

</div>


<div class="modal " id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog loginDivInProductPageModalDiv">
        <div class="modal-content">
            <div class="loginDivInProductPage">
                <div class="loginErrorMessageDiv">
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>

                <div class="login_acount_text">θ΄¦ζ·η»ε½</div>
                <div class="loginInput ">
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-user"></span>
							</span>
                    <input id="name" name="name" placeholder="ζζΊ/δΌεε/ι?η?±" type="text">
                </div>

                <div class="loginInput ">
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-lock"></span>
							</span>
                    <input id="password" name="password" type="password" placeholder="ε―η " type="text">
                </div>
                <span class="text-danger">δΈθ¦θΎε₯ηε?ηε°ηθ΄¦ε·ε―η </span><br><br>
                <div>
                    <a href="#nowhere">εΏθ?°η»ε½ε―η </a>
                    <a href="registerPage" class="pull-right">εθ΄Ήζ³¨ε</a>
                </div>
                <div style="margin-top:20px">
                    <button class="btn btn-block redButton loginSubmitButton" type="submit">η»ε½</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog">
    <div class="modal-dialog deleteConfirmModalDiv">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">Γ</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">η‘?θ?€ε ι€οΌ</h4>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">ε³ι­</button>
                <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">η‘?θ?€</button>
            </div>
        </div>
    </div>
</div>
</div>

<div id="footer" class="footer" style="display: block;">

    <div id="footer_ensure" class="footer_ensure">
        <a href="#nowhere">
            <img src="img/site/ensure.png">
        </a>
    </div>

    <div class="horizontal_line">
    </div>



    <div style="clear:both">

    </div>


    <div id="copyright" class="copyright">
        <div class="coptyrightMiddle">
            <img id="cateye" class="cateye" src="img/site/cateye.png">


            <div class="white_link">
                <a href="#nowhere" style="padding-left:0px"> ε±±η§ε€§γθ?‘η?ζΊοΌοΌοΌγο½ο½ο½εΌεε°η»ιε’</a><span class="slash">|</span>
                <a href="#nowhere"> ζεΌΊεΊη</a><span class="slash">|</span>

                <a href="#nowhere"> ζεΌΊεΊη </a><span class="slash">|</span>
                <a href="#nowhere"> ζεΌΊεΊη </a><span class="slash">|</span>
                <a href="#nowhere"> ζεΌΊεΊη </a><span class="slash">|</span>
                <a href="#nowhere"> ζεΌΊεΊη </a><span class="slash">|</span>
                <a href="#nowhere"> ζεΌΊεΊη </a>
            </div>


        </div>
    </div>
</div>
</body>

</html>
