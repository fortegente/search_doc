<?php
class registerinfo extends oxUBase
{
    protected $_sThisTemplate = 'register-info.tpl';

    public function render()
    {
        if ($this->getUser()) {
            oxRegistry::getUtils()->redirect('');
        }

        return parent::render();
    }
}