<%@ Control Language="C#" AutoEventWireup="true" CodeFile="slide.ascx.cs" Inherits="LayOut_slide" %>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jssor.slider.mini.js"></script>
    <!-- use jssor.slider.debug.js instead for debug -->
    <script>
        jQuery(document).ready(function ($) {

            var jssor_1_SlideoTransitions = [
              [{ b: 0.0, d: 600.0, y: -290.0, e: { y: 27.0 } }],
              [{ b: 0.0, d: 1000.0, y: 185.0 }, { b: 1000.0, d: 300.0, o: -1.0 }, { b: 1500.0, d: 500.0, o: 1.0 }, { b: 2000.0, d: 1500.0, r: 360.0 }, { b: 3500.0, d: 1000.0, rX: 30.0 }, { b: 4500.0, d: 500.0, rX: -30.0 }, { b: 5000.0, d: 1000.0, rY: 30.0 }, { b: 6000.0, d: 500.0, rY: -30.0 }, { b: 6500.0, d: 500.0, sX: 1.0 }, { b: 7000.0, d: 500.0, sX: -1.0 }, { b: 7500.0, d: 500.0, sY: 1.0 }, { b: 8000.0, d: 500.0, sY: -1.0 }, { b: 8500.0, d: 500.0, kX: 30.0 }, { b: 9000.0, d: 500.0, kX: -30.0 }, { b: 9500.0, d: 500.0, kY: 30.0 }, { b: 10000.0, d: 500.0, kY: -30.0 }, { b: 10500.0, d: 500.0, c: { x: 87.50, t: -87.50 } }, { b: 11000.0, d: 500.0, c: { x: -87.50, t: 87.50 } }],
              [{ b: 0.0, d: 600.0, x: 410.0, e: { x: 27.0 } }],
              [{ b: -1.0, d: 1.0, o: -1.0 }, { b: 0.0, d: 600.0, o: 1.0, e: { o: 5.0 } }],
              [{ b: -1.0, d: 1.0, c: { x: 175.0, t: -175.0 } }, { b: 0.0, d: 800.0, c: { x: -175.0, t: 175.0 }, e: { c: { x: 7.0, t: 7.0 } } }],
              [{ b: -1.0, d: 1.0, o: -1.0 }, { b: 0.0, d: 600.0, x: -570.0, o: 1.0, e: { x: 6.0 } }],
              [{ b: -1.0, d: 1.0, o: -1.0, r: -180.0 }, { b: 0.0, d: 800.0, o: 1.0, r: 180.0, e: { r: 7.0 } }],
              [{ b: 0.0, d: 1000.0, y: 80.0, e: { y: 24.0 } }, { b: 1000.0, d: 1100.0, x: 570.0, y: 170.0, o: -1.0, r: 30.0, sX: 9.0, sY: 9.0, e: { x: 2.0, y: 6.0, r: 1.0, sX: 5.0, sY: 5.0 } }],
              [{ b: 2000.0, d: 600.0, rY: 30.0 }],
              [{ b: 0.0, d: 500.0, x: -105.0 }, { b: 500.0, d: 500.0, x: 230.0 }, { b: 1000.0, d: 500.0, y: -120.0 }, { b: 1500.0, d: 500.0, x: -70.0, y: 120.0 }, { b: 2600.0, d: 500.0, y: -80.0 }, { b: 3100.0, d: 900.0, y: 160.0, e: { y: 24.0 } }],
              [{ b: 0.0, d: 1000.0, o: -0.4, rX: 2.0, rY: 1.0 }, { b: 1000.0, d: 1000.0, rY: 1.0 }, { b: 2000.0, d: 1000.0, rX: -1.0 }, { b: 3000.0, d: 1000.0, rY: -1.0 }, { b: 4000.0, d: 1000.0, o: 0.4, rX: -1.0, rY: -1.0 }]
            ];

            var jssor_1_options = {
                $AutoPlay: true,
                $Idle: 2000,
                $CaptionSliderOptions: {
                    $Class: $JssorCaptionSlideo$,
                    $Transitions: jssor_1_SlideoTransitions,
                    $Breaks: [
                      [{ d: 2000, b: 1000 }]
                    ]
                },
                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$
                },
                $BulletNavigatorOptions: {
                    $Class: $JssorBulletNavigator$
                }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizing
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 600);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>

    <style>
        
        /* jssor slider bullet navigator skin 01 css */
        /*
        .jssorb01 div           (normal)
        .jssorb01 div:hover     (normal mouseover)
        .jssorb01 .av           (active)
        .jssorb01 .av:hover     (active mouseover)
        .jssorb01 .dn           (mousedown)
        */
        .jssorb01 {
            position: absolute;
        }
        .jssorb01 div, .jssorb01 div:hover, .jssorb01 .av {
            position: absolute;
            /* size of bullet elment */
            width: 12px;
            height: 12px;
            filter: alpha(opacity=70);
            opacity: .7;
            overflow: hidden;
            cursor: pointer;
            border: #000 1px solid;
        }
        .jssorb01 div { background-color: gray; }
        .jssorb01 div:hover, .jssorb01 .av:hover { background-color: #d3d3d3; }
        .jssorb01 .av { background-color: #fff; }
        .jssorb01 .dn, .jssorb01 .dn:hover { background-color: #555555; }

        /* jssor slider arrow navigator skin 02 css */
        /*
        .jssora02l                  (normal)
        .jssora02r                  (normal)
        .jssora02l:hover            (normal mouseover)
        .jssora02r:hover            (normal mouseover)
        .jssora02l.jssora02ldn      (mousedown)
        .jssora02r.jssora02rdn      (mousedown)
        */
        .jssora02l, .jssora02r {
            display: block;
            position: absolute;
            /* size of arrow element */
            width: 55px;
            height: 55px;
            cursor: pointer;
            background: url('images/img/a02.png') no-repeat;
            overflow: hidden;
        }
        .jssora02l { background-position: -3px -33px; }
        .jssora02r { background-position: -63px -33px; }
        .jssora02l:hover { background-position: -123px -33px; }
        .jssora02r:hover { background-position: -183px -33px; }
        .jssora02l.jssora02ldn { background-position: -3px -33px; }
        .jssora02r.jssora02rdn { background-position: -63px -33px; }
    </style>


   <div style="position: relative;
    left: -275px;">
    <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden; visibility: hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('images/img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden;">
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="images/d7tmdt2016.jpg" />
                <div data-u="caption" data-t="0" data-hwa="1" style="position: absolute; top: 320px; left: 30px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center;">Sinh viên khoa công nghệ thông tin</div>
            </div>
           
           
           
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="images/IMG_1325.jpg" />
                <div data-u="caption" data-t="4" style="position: absolute; top: 30px; left: 30px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.6); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center;">Giải thể thao khoa</div>
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="images/olp2015_2.jpg" />
                <div data-u="caption" data-t="5" data-hwa="1" style="position: absolute; top: 30px; left: 600px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center;">Oplypic tin học</div>
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="images/13173622_828712770568551_1588179391443994213_n.jpg" />
                <div data-u="caption" data-t="6" style="position: absolute; top: 30px; left: 30px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center;">D8CNPM LÀ MỘT GIA ĐÌNH</div>
            </div>
            
           
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb01" style="bottom:16px;right:16px;">
            <div data-u="prototype" style="width:12px;height:12px;"></div>
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora02l" style="top:0px;left:8px;width:55px;height:55px;" data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora02r" style="top:0px;right:8px;width:55px;height:55px;" data-autocenter="2"></span>
        <a href="http://www.jssor.com" style="display:none">Bootstrap Carousel</a>
    </div>
       </div>
    <div class="gt" style="height:300px; ">
        <h3 style="border-bottom:1px solid #fff">HUÂN CHƯƠNG LAO ĐỘNG</h3>
        <div style="margin-bottom:10px">
        <span class="Apple-style-span" style=" font-size: 13px; line-height: 21px;">Ngày 18/11/2010 Chủ tịch nước đã phong tặng huân chương lao động hạng 3 cho khoa CNTT- Trường Đại học Điện lực: " Đã có thành tích xuất sắc trong công tác từ năm 2005-2009, góp phần vào sự nghiệp xây dựng chủ nghĩa xã hội và bảo vệ tổ quốc".</span>
    <br />
            </div>
        <a href="#" style="float:right;margin-right: 50px;">Đọc tiếp</a>
    
    </div>
