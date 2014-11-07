<?php

class mantenimientoController extends Controller
{
    public function __construct() {
        parent::__construct();
    }

    public function index()
    {
        $post = $this->loadModel('post');
        $this->_view->tpersona = $post->getPosts();
        $this->_view->renderizar('index');
       
    }
}
?>