<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>成員介紹</title>
    <link rel="icon" href="assets/img/wand.png">
    <link rel="stylesheet" href="assets/css/aboutus.css" type="text/css">
</head>
<body>
    <section>   <!--導覽列-->
        <%@include file="header.jsp" %>
    </section>
    <!-- 各學院 -->
    <section class="aboutall">
        <div class="about g">
            <img class="img1" src="assets/img/gg.png" >
            <!-- <a href="#"> -->
                <div class="mask">
                    <img src="assets/img/dan.jpg" alt=""width="70%">
                    <p>工作內容：後端開發<br>專長：魔術<br>興趣：羽球</p>
                    <p>這次做後端其實還滿好玩的，可以運用許多自己的邏輯配合資料庫去做搭配，甚至還可以在後台做出銷售圖表等等。<br>這個專案從開始到結束大概花了五天，但我覺得會那麼快是因為我們班有先學資料庫了，如果沒學的話應該要再花時間去熟悉語法！因為網程老師教的DB對我來說太淺了。</p>
                    

                </div>
            <!-- </a> -->
        </div>
        <div class="about h">
            <img class="img1" src="assets/img/hh.png">
            <a href="#">
                <div class="mask">
                    <img src="assets/img/gou.jpg" alt=""width="70%">
                    <p>工作內容：後端開發<br>專長：程式設計<br>興趣：玩樂團、跳舞、編程</p>
                    <p>這次做起來覺得相較於前端來說我個人更喜歡這次吧，畢竟邏輯應用一直都是我比較擅長也比較喜歡的方面，尤其在程式上，能夠應用邏輯去達成一些效果，這讓我做起來的成就感很大！<br>
五天的實作其實說長不長說短也不短，只能說自己編程速度能更快一點，也因為有這先學過語法，所以在整體上其實對於速度有很大的提升。</p>
                </div>
            </a>
        </div>
        <div class="about k">
            <img class="img1" src="assets/img/kk.png" >
            <a href="#">
                <div class="mask">
                
                    <img src="assets/img/fang.jpg" alt=""width="70%">
                    <p>工作內容：前端設計<br>專長：通靈<br>興趣：敗家</p>
                    <p>在本次專題中，我學到了很多關於網頁設計方面的知識。
                        在設計過程中也出現了很多的問題，但通過看書，上網查詢，請教老師等方式，不斷的學習、解決，
                        設計出的網頁不論是外觀還是內容，都在不斷的進步、改善。<br>
                        希望我可以獨立自己寫出一套完整的網頁(前、後端)</p>
                </div>
                
            </a>
        </div>
        <div class="about s">
            <img class="img1" src="assets/img/ss.png" >
            <a href="#">
                <div class="mask">
                    <img src="assets/img/ss.jpg" alt=""width="70%">
                    <p>工作內容：前端設計<br>專長：設計<br>興趣：BTS粉</p>
                    <p>這次做前端是在做網頁來講我比較擅長的部分。雖然過程中也有遇到一些困難和一直解決不了的問題，但在嘗試各種方法以及向同學尋求協助之後，還是成功做出一個算是完整的網頁。<br>
                    雖然有很多想做出來的動畫，但因為時間和能力關係沒辦法把所有的都做出來。不過透過這次我也學到了很多新用法，對原本不熟練的地方也逐漸上手，讓我還是有些成就感的！</p>

                </div>
            </a>
        </div>
    </section>
    <!-- 聯絡與介紹 -->
    <section class="down">
        <div class="intro">
            <h1>Origin</h1>
            <div class="intro_word">
                位於倫敦的斜角巷南側，是一家由奧利凡德家族經營的魔仗商店。
                目前商店的擁有者是年長的家庭成員加里克·奧利凡德。通常被稱為奧利凡德先生。
                奧利凡德先生最晚從20世紀30年代就開始擔任店主，並記得他所賣出的每一根魔仗。
                奧利凡德家族被公認為是英國最好的魔仗製造師，在歐洲也名列前茅。
                奧利凡德家族從公元前382年開始經營魔仗生意。
                儘管英國還有其他魔仗製造師，但大多是英國人還是在奧利凡德這裡購買魔仗，
                包括幾乎所有即將進入霍格華茲魔法與巫師學院就讀的新生。
            </div>
            <a href="product.jsp" class="more1" style="text-decoration:none;">
                <div class="more">
                    <p class="more_word">MORE</p>
                </div>
            </a>
        </div>
        <div class="ccc">
            <form method="post" action="mailto:">
                <h1>聯絡我們</h1>
                <div class="contact">
                  <label for="name">姓名：</label>
                  <input type="text" name="" id="name" class="ipt">
                </div>
                <div class="contact">
                  <label for="email">信箱：</label>
                  <input type="email" name="" id="email" class="ipt">
                </div>
                <div class="contact">
                  <label for="feedback">想說的話：</label><br>
                  <textarea name="" id="feedback" cols="40" rows="4" class="ipt"></textarea>
      
                </div>
                <div class="btnmain">
                  <input type="submit" name="" value="寄出" class="btn">
                  <input type="reset" name="" value="取消" class="btn">
                </div>
              </form>
        </div>
       
    </section>
    <%@include file="footer.jsp" %>
</body>
</html>