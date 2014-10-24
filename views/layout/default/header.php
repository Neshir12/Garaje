<html>
    <head>
        <title><?php if(isset($this->titulo)) echo $this->titulo; ?></title>
        <link href="<?php echo $_layoutParams['ruta_css'] ?>estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
            <div id="main">
                <div id="header">
                    <div id="logo">
                        <h1><?php echo APP_NAME; ?></h1>
                    </div>

                    <div id="menu">
                        <div id="top_menu">
                <ul>
                    <?php if(isset($_layoutParams['menu'])): ?>
                    <?php for($i = 0; $i<count($_layoutParams['menu']); $i++): ?>
                    
                    <li>
                        <a href="<?php echo $_layoutParams['menu'][$i]['enlace']; ?>"><?php echo $_layoutParams['menu'][$i]['titulo']; ?></a>
                    </li>
                    
                    <?php endfor; ?>
                    <?php endif; ?>
                </ul>
            
                </div>
            </div>
        </div>
        <div id="content">
            <div id="error"><?php if(isset($this->_error)) echo $this->_error;  ?></div>
            
