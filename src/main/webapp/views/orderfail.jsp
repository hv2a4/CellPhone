<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="vi-VN" data-nhanh.vn-template="T0321">

<head>
    <meta name="robots" content="noindex" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Đặt hàng thành công</title>
    <meta name="DC.language" content="scheme&#x3D;utf-8&#x20;content&#x3D;vi">
    <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE">
    <meta name="google-site-verification" content="">
    <meta name="facebook-domain-verification" content="">
    <link
        href="https&#x3A;&#x2F;&#x2F;pos.nvncdn.com&#x2F;26be7c-108267&#x2F;store&#x2F;20211001_RsxwnyE2uyECueudjoycnOPK.png"
        rel="icon" type="image&#x2F;vnd.microsoft.icon">
    <link rel="stylesheet" href="https://web.nvnstatic.net/css/fontAwesome/fontawesome-5.0.13.min.css?v=4"
        type="text/css">
    <link rel="stylesheet" href="https://web.nvnstatic.net/css/bootstrap/bootstrap.4.3.1.min.css?v=4" type="text/css">
    <link rel="stylesheet" href="https://web.nvnstatic.net/css/owlCarousel/owl.carousel.min.2.3.4.css?v=4"
        type="text/css">
    <link rel="stylesheet" href="https://web.nvnstatic.net/js/mmenu/css/jquery.mmenu.css?v=4" type="text/css">
    <link rel="stylesheet" href="https://web.nvnstatic.net/tp/T0321/css/style.css?v=66" type="text/css">
    <script defer type="text/javascript" src="https://web.nvnstatic.net/js/jquery/jquery.min.js?v=2"></script>
    <script defer type="text/javascript" src="https://web.nvnstatic.net/js/lib.js?v=2"></script>
    <script defer type="text/javascript" src="https://web.nvnstatic.net/js/jquery/jquery.cookie.js?v=2"></script>
    <script defer type="text/javascript" src="https://web.nvnstatic.net/js/jquery/jquery.number.min.js?v=2"></script>
    <script defer type="text/javascript"
        src="https://web.nvnstatic.net/js/jquery/jquery-ui-1.10.3.custom.min.js?v=2"></script>
    <script defer type="text/javascript" src="https://web.nvnstatic.net/js/mmenu/js/jquery.mmenu.min.js?v=2"></script>
    <script defer type="text/javascript" src="https://web.nvnstatic.net/js/jquery/slimscroll.min.js?v=2"></script>
    <script defer type="text/javascript"
        src="https://web.nvnstatic.net/js/bootstrap/boostrap.popper.min.js?v=2"></script>
    <script defer type="text/javascript"
        src="https://web.nvnstatic.net/js/bootstrap/bootstrap.4.3.1.min.js?v=2"></script>
    <script defer type="text/javascript"
        src="https://web.nvnstatic.net/js/owlCarousel/owl.carousel.min.js?v=2"></script>
    <script defer type="text/javascript" src="https://web.nvnstatic.net/tp/T0321/js/main.js?v=15"></script>
    <style type="text/css">
        .tp_text_color {
            color: #140202 !important
        }
        .tp_button {
            background: #e90c0c !important;
            border-color: #e90c0c !important;
            box-shadow: none !important
        }

        .tp_button {
            color: #ffffff !important
        }

        .tp_button:hover {
            background: #b00c0c !important
        }

        .tp_product_name,
        .tp_product_name>a {
            color: #140202 !important
        }

        .tp_product_price {
            color: #140202 !important
        }

        .tp_product_price_old {
            color: #000000 !important
        }

        .tp_title {
            color: #140202 !important
        }

        .tp_title,
        .tp_title>span {
            background: #000000 !important
        }

        .tp_menu .tp_menu_item.active,
        .tp_menu .tp_menu_item.active>a {
            color: #140202 !important
        }

        .tp_menu .tp_menu_item {
            color: #140202 !important
        }

        .tp_menu .tp_menu_item {
            font-size: 20px !important
        }

        .tp_banner_main {
            display: block !important
        }

        .tp_product_new {
            display: block !important
        }

        .tp_product_hot {
            display: block !important
        }

        .tp_product_betseller {
            display: block !important
        }

        .tp_product_category_box {
            display: block !important
        }

        .tp_product_discount {
            display: block !important
        }

        .tp_footer {
            background: #140202 !important
        }

        .tp_product_detail .tp_product_detail_related {
            display: block !important
        }

        .tp_product_detail .tp_product_detail_suggest {
            display: block !important
        }

        .tp_product_detail .tp_product_detail_suggest {
            display: block !important
        }

        .tp_product_detail .tp_product_detail_history {
            display: block !important
        }

        .tp_product_detail .tp_product_detail_tag {
            display: block !important
        }

        .tp_product_detail .tp_product_detail_comment {
            display: block !important
        }

        .tp_product_detail .tp_product_detail_depot {
            display: block !important
        }

        .tp_product_detail .tp_product_detail_price {
            color: #e41b35 !important
        }

        .tp_product_detail .tp_product_detail_price_old {
            color: #000000 !important
        }

        .tp_product_detail .tp_product_detail_name {
            color: #000000 !important
        }

        .tp_product_category .tp_product_category_filter_attribute {
            display: block !important
        }

        .tp_product_category .tp_product_category_filter_brand {
            display: block !important
        }

        .tp_product_category .tp_product_category_filter_category {
            display: block !important
        }

        .tp_product_category .tp_product_category_filter_price {
            display: block !important
        }
    </style>

    <script src="https://pos.nvnstatic.net/cache/location.vn.js?v=240517_114002" defer></script>
    <style>
        figure.image {
            clear: both;
            display: table;
            margin: .9em auto;
            min-width: 50px;
            text-align: center;
            width: auto !important;
        }

        figure.image img {
            display: block;
            margin: 0 auto;
            max-width: 100%;
            min-width: 100%;
        }

        figure.image>figcaption {
            background-color: #f7f7f7;
            caption-side: bottom;
            color: #333;
            display: block;
            font-size: .75em;
            outline-offset: -1px;
            padding: .6em;
            word-break: break-word;
        }

        figure.image img,
        img.image_resized {
            height: auto !important;
            aspect-ratio: auto !important;
        }
    </style>
    <script src="https://web.nvnstatic.net/js/translate/vi-vn.js" defer></script>
</head>

<body class="tp_background tp_text_color">
    <input type="hidden" value="108267" id="storeId">
   

   
        
    <div class="order-content">
        <div class="container">
            <div class="orderView">
                <div class="picsuccess">
                    <!--            <img width="320" height="120" src="/Content/mobile/images/V4/pic-success.png">-->
                    <img width="320" height="120"
                        src="https://pos.nvncdn.com/26be7c-108267/store/20211001_drDdKcUKHoG0paeW6h9xKvP7.png">
                    <div class="notistatus text-danger"><i class="iconnoti iconerror"></i>Thanh toán thất bại</div>
                </div>
                <div class="thank">Cảm ơn <b>${list.FULLNAME}</b> đã cho chúng tôi cơ hội được phục vụ.
                    Trong thời gian nhất, nhân viên chúng tôi sẽ gửi tin nhắn hoặc gọi điện xác nhận giao hàng cho Qúy
                    Khách
                </div>
                <div class="clearfix"></div>

                <div class="titlebill">Thông tin đặt hàng:</div>
                <div class="infoorder">
                    <div>Mã đơn hàng: <b>${order.ID }</b></div>
                    <div>Địa chỉ nhận hàng: <b>${adr}</b></div>
                    <div><b>${pay}</b></div>
                    <div>Tổng tiền: <strong class="red">
                    <fmt:formatNumber value="${order.TOTAL_AMOUNT }"
											pattern="###,###.###" /></strong></div>
                </div>
                <div class="callship">
                    Trước khi giao nhân viên sẽ gọi cho Qúy khách <b>${list.FULLNAME}</b>
                    để xác nhận. Khi cần hỗ trợ vui lòng gọi
                    <a href="tel:19002812">19002812</a> hoặc
                    <a href="tel:"></a>
                </div>      
                <a href="/shop/store" class="buyother">Mua thêm sản phẩm khác</a>
                <div class="clr"></div>
            </div>
        </div>
    </div>
    
    <style type="text/css">
        body {
            background: #f0f0f0;
        }

        .order-content {
            background: #fff;
            padding-top: 50px;
            padding-bottom: 30px;
        }

        .orderView {
            width: 600px;
            background: #fff;
            margin: 0 auto;
            padding-bottom: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, .15);
        }

        .picsuccess {
            display: block;
            overflow: visible;
            position: relative;
            width: 600px;
        }

        .picsuccess img {
            display: block;
            width: 100%;
            max-width: 640px;
            height: auto;
            object-fit: scale-down;
        }

        .picsuccess .notistatus {
            position: absolute;
            left: 0;
            right: 0;
            bottom: -18px;
            width: 280px;
            line-height: 36px;
            font-size: 16px;
            color: #00af1d;
            font-weight: 600;
            text-align: center;
            display: block;
            margin: auto;
            text-transform: uppercase;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .16);
        }

        .iconnoti {
            background: url(https://cdn.tgdd.vn/v2015/Content/desktop/images/V4/iconcartmobile@2x.png) no-repeat;
            background-size: 80px 85px;
            width: 20px;
            height: 20px;
            vertical-align: middle;
            display: inline-block;
        }

        .iconsuccess {
            background-position: -25px 0;
            width: 19px;
            height: 15px;
            margin-right: 3px;
        }

        .thank {
            display: block;
            overflow: hidden;
            width: 560px;
            margin: auto;
            color: #333;
            line-height: 22px;
            padding: 40px 20px 20px;
            background: #fff;
        }

        .titlebill {
            display: block;
            margin: 0 20px;
            line-height: 30px;
            font-size: 14px;
            color: #333;
            background: #f3f3f3;
            text-transform: uppercase;
            padding: 0 10px;
        }

        .infoorder,
        .callship,
        .cty {
            display: block;
            overflow: hidden;
            font-size: 14px;
            color: #333;
            padding: 10px 20px 0 20px;
            margin: auto;
            background: #fff;
        }

        .infoorder div {
            display: block;
            overflow: hidden;
            margin-bottom: 5px;
            padding-left: 10px;
        }

        .callship {
            line-height: 22px;
            padding-bottom: 10px;
        }

        .callship a {
            color: #288ad6;
            font-weight: 600;
        }

        .titlebill {
            display: block;
            margin: 0 20px;
            line-height: 30px;
            font-size: 14px;
            color: #333;
            background: #f3f3f3;
            text-transform: uppercase;
        }

        .listorder {
            display: block;
            overflow: visible;
            background: #fff;
            width: 600px;
            margin: auto;
        }

        .listorder li {
            display: block;
            overflow: visible;
            border-bottom: 1px solid #eee;
            padding: 10px 0;
            margin: 0 20px;
        }

        .listorder li .colimg {
            float: left;
            overflow: hidden;
            width: 75px;
        }

        .listorder li a {
            display: block;
            overflow: hidden;
        }

        .listorder li img {
            display: block;
            width: 55px;
            height: 55px;
            margin: 5px auto 10px;
        }

        .listorder li .colinfo {
            display: block;
            overflow: visible;
            margin-left: 75px;
        }

        .listorder li .colinfo strong {
            font-weight: 300;
            font-size: 14px;
            color: #c10017;
            float: right;
            margin-right: 10px;
        }

        .listorder li a {
            display: block;
            overflow: hidden;
        }

        .listorder li .colinfo a {
            display: inline-block;
            font-size: 14px;
            color: #333;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            text-overflow: ellipsis;
            width: 62%;
        }

        .onecolor {
            float: left;
            position: relative;
            background: #fff;
            font-size: 14px;
            color: #333;
            margin-top: 10px;
        }

        .onecolor span {
            color: #999;
        }

        .quan {
            float: right;
            margin-top: 10px;
            margin-right: 10px;
        }

        .listorder li .promotion {
            background: #fff;
            padding: 5px;
            height: auto;
            margin: 10px 10px 0 0;
            display: block;
            overflow: hidden;
        }

        .listorder li .promotion.choose {
            overflow: visible !important;
            margin-top: 5px !important;
            float: left;
            width: 90%;
        }

        .buyother {
            display: block;
            overflow: hidden;
            background: #fff;
            line-height: 40px;
            text-align: center;
            margin: 15px auto;
            width: 300px;
            font-size: 14px;
            color: #288ad6;
            font-weight: 600;
            text-transform: uppercase;
            border: 1px solid #288ad6;
            border-radius: 4px;
        }
    </style>
    <div id="site-overlay" class="site-overlay"></div>
    <div class="modalPview">
        <div class="modalAlert modal fade in"></div>
    </div>
    <div class="hotline-phone-ring-wrap">
        <div class="hotline-phone-ring">
            <div class="hotline-phone-ring-circle"></div>
            <div class="hotline-phone-ring-circle-fill"></div>
            <div class="hotline-phone-ring-img-circle">
                <a href="tel:19002812" class="pps-btn-img">
                    <img src="https://web.nvnstatic.net/tp/T0321/img/icon-call-nh.png?v=3" alt="Gọi điện thoại"
                        width="50">
                </a>
            </div>
        </div>
    </div>
    <div id="modalShow" class="modal fade" role="dialog">
        <div class="modal-dialog ">
            <div class="modal-content"></div>
        </div>
    </div>

</body>

</html>