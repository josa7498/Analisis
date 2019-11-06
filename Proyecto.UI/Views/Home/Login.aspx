﻿
@{
    ViewBag.Title = "Login";
    Layout = "~/Views/_LayoutPage1.cshtml";
}
<h1>ScamBook </h1>
<div class="clear-loading spinner">
    <span></span>
</div>
<div class="w3ls-login box box--big">
    <!-- form starts here -->
    <form action="Verify" method="post">
        <div class="agile-field-txt">
            <label><i class="fa fa-user" aria-hidden="true"></i> Username </label>
            <input type="text" name="usuario" placeholder="Enter User Name" required="" />
        </div>
        <div class="agile-field-txt">
            <label><i class="fa fa-unlock-alt" aria-hidden="true"></i> password </label>
            <input type="password" name="clave" placeholder="Enter Password" required="" id="myInput" />
            <div class="agile_label">
                <input id="check3" name="check3" type="checkbox" value="show password" onclick="myFunction()">
                <label class="check" for="check3">Show password</label>
            </div>
            <div class="agile-right">
                <a href="#">forgot password?</a>
            </div>
        </div>
        <!-- script for show password -->
        <script>
				function myFunction() {
					var x = document.getElementById("myInput");
					if (x.type === "password") {
						x.type = "text";
					} else {
						x.type = "password";
					}
				}
        </script>
        <!-- //end script -->
        <input type="submit" value="LOGIN">
    </form>
</div>
<!-- //form ends here -->
<!--copyright-->
<div class="copy-wthree">
    <p>
        © 2019 Spin Login Form . All Rights Reserved | Design by
        <a href="https://www.electronicdesign.com/sites/electronicdesign.com/files/gallery_promo_image/Engineers-during_0.gif" target="_blank">meme</a>
    </p>
</div>
<!--//copyright-->