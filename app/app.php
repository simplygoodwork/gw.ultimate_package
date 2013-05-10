<?php

require_once __DIR__.'/bootstrap.php';

/**
 * Smallest controller eva
 */
$app['debug'] = true;
$app->get('{template}', function() use($app) {
    $template = rtrim($app['request']->get('template'), '/');
    $template = (substr ($template, -5) == '.html') ? $template : $template.'/index.html';

    // Generate a 404 if we can't find the template
    if (!file_exists(__DIR__.'/../templates/'.$template)) {
        $app->abort(404, "Template '$template' does not exist.");
    }

    $template_vars = array(
        'STATIC_URL' => '/static/',
        'debug' => $app['debug']
    );

    return $app['twig']->render($template, $template_vars);
})
->assert('template', '.*')
->method('GET');

return $app;
