<?php
    function FiltriranjeOutputa($output)
    {
        $output = htmlspecialchars($output, ENT_SUBSTITUTE, 'UTF-8');

        return $output;
    }
?>