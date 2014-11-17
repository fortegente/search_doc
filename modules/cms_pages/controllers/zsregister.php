<?php
class zsregister extends zsregister_parent
{
    public function render()
    {
        $this->_aViewData['reg_type'] = oxConfig::getParameter('reg_type');

        return parent::render();
    }
}