<html>
    <head>
        <title><?php if(isset($this->titulo)) echo $this->titulo; ?></title>
        <link href="<?php echo $_layoutParams['ruta_css'] ?>estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
            <div id="main">
                <div id="header">
                    <div id="logo">
                        <h1><?php echo APP_NAME;?><img src="<?php echo $_layoutParams['ruta_img'] ?>garage.png" WIDTH=40 HEIGHT=40  HSPACE=8 alt="Pintura geométrica"></h1>
                        
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
            
                </div><a href="<?php BASE_URL; ?>index">CERRAR SESION</a>
                    </div> 
        </div>
        <div id="content">
            <div id="error"><?php if(isset($this->_error)) echo $this->_error;  ?></div>
            
