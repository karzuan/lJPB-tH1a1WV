<div class="ajax-container">
    <div class="login-form-content">
        <h2><?php echo $text_returning_customer; ?></h2>
        <p><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
        <form action="#" method="post" id="ajax-login-form" enctype="multipart/form-data">
            <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
            </div>
            <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
            </div>
            <div class="action">
                <input type="button" value="<?php echo $button_login; ?>" onclick="opcajaxlogin.loginAction(document.getElementById('input-email').value, document.getElementById('input-password').value)" class="btn btn-primary" />
                <input type="button" value="<?php echo $button_register_link; ?>" onclick="opcajaxlogin.appendRegisterForm()" class="btn btn-primary" />
                <img class="ajax-load-img" alt="" src="<?php echo $loader_img ?>" width="30" height="30" />
            </div>
            <?php if ($redirect) { ?>
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            <?php } ?>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var keycode = '';

        $('#input-email').keypress(function (e) {
            keycode = (e.keyCode ? e.keyCode : e.which);
            if(keycode == '13') {
                opcajaxlogin.loginAction(opcajaxlogin.loginAction(document.getElementById('input-email').value, document.getElementById('input-password').value));
            }
        });

        $('#input-password').keypress(function (e) {
            keycode = (e.keyCode ? e.keyCode : e.which);
            if(keycode == '13') {
                opcajaxlogin.loginAction(opcajaxlogin.loginAction(document.getElementById('input-email').value, document.getElementById('input-password').value));
            }
        });
    });

</script>

