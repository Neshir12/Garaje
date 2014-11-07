<?php

class postController extends Controller 
{
    private $_post;
    public function __construct() 
    {
        parent::__construct();
        $this->_post = $this->loadModel('post');
    }
     public function index()
    {
        $this->_view->tpersona = $this->_post->getPosts();
        $this->_view->titulo = 'Post';
        $this->_view->renderizar('index','header','footer','post');
       
    }
}
?>
