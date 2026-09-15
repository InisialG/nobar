<?php
$file = 'FINAL_CLEAN_boro_events.sql';
$content = file_get_contents($file);
$content = preg_replace('/^\xEF\xBB\xBF/', '', $content);
$content = str_replace("\r\n", "\n", $content);
$content = preg_replace('/^--.*$/m', '', $content);
$content = preg_replace('/^\n+$/m', '', $content);
file_put_contents($file, $content);
echo "Cleaned FINAL!\n";
