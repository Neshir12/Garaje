<?php

class postController extends Controller
{
    private $_post;
    
    public function __construct() {
        parent::__construct();
        $this->_post = $this->loadModel('post');
    }
    
    public function index()
    {
        $this->_view->tpersona = $this->_post->getPosts();
        $this->_view->titulo = 'Post';
        $this->_view->renderizar('index','header','footer', 'post');
    }
    public function nuevo()
    {
        $this->_view->titulo = 'Nuevo Post';
        $this->_view->setJs(array('nuevo'));
        
        if($this->getInt('guardar') == 1){
            $this->_view->datos = $_POST;
            
            if(!$this->getTexto('idPersona')){
                $this->_view->_error = 'Debe introducir el Id de la persona';
                $this->_view->renderizar('nuevo','header','footer', 'post');
                exit;
            }
            if(!$this->getTexto('Dni')){
                $this->_view->_error = 'Debe introducir el Dni de la persona';
                $this->_view->renderizar('nuevo','header','footer', 'post');
                exit;
            }
            
            if(!$this->getTexto('Nombre')){
                $this->_view->_error = 'Debe introducir el Nombre de la persona';
                $this->_view->renderizar('nuevo','header','footer', 'post');
                exit;
            }
            if(!$this->getTexto('Apellidos')){
                $this->_view->_error = 'Debe introducir el Apellido de la persona';
                $this->_view->renderizar('nuevo','header','footer', 'post');
                exit;
            }
            
            $this->_post->insertarPost(
                    $this->getTexto('idPersona'),
                    $this->getTexto('Dni'),
                    $this->getTexto('Nombre'),
                    $this->getTexto('Apellidos')
                    );
            
            $this->redireccionar('post');
        }       
        
        $this->_view->renderizar('nuevo','header','footer', 'post');
    }
}
?>
