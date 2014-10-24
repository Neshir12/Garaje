<?php
class Request
{
    private $_controlador;
    private $_metodo;
    private $_argumentos;
    
    public function __construct()
    {
        if(isset($_GET['url']))//si esta difinida y no es null
        {
            $url = filter_input(INPUT_GET, 'url' , FILTER_SANITIZE_URL);//filtra el url
            $url = explode('/' , $url);//explode crea un arreglo y los divide despues de cada /
            $url = array_filter($url);
            
        $this->_controlador =  strtolower( array_shift($url));//obtiene el primer arreglo y vuelve primero al sigiente arreglo
        $this->_metodo = strtolower( array_shift($url));//obtiene el segundo arreglo como en primero
        $this->_argumentos = $url;//obtiene el resto del arreglo
        }
        
        
        
        if(!$this->_controlador)//Si no existe controlador
        {
            $this->_controlador = DEFAULT_CONTROLLER;
        }
        
        if(!$this->_metodo)//Si no existe metodo
        {
            $this->_metodo = 'index';
        }
        
        if(!isset($this->_argumentos))//Si no existe argumentos
        {
            $this->_argumentos = array();
        }
        
    }
    
    public function getControlador()
    {
        return $this->_controlador;
    }
    
    public function getMetodo()
    {
        return $this->_metodo;
    }
    
    public function getArgs()
    {
        return $this->_argumentos;
    }
}
?>
