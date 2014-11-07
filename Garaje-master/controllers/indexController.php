<?php

class indexController extends Controller
{
    public function __construct() {
        parent::__construct();
    }

    public function index()
    {
        $this->_view->renderizar('index','header1','footer1');
       
    }
        public function register()
    {
        $this->_view->renderizar('register','header1','footer1');
       
    }
}
?>