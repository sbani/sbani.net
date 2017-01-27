---
title: View / Template Klasse auf Basis von PHP (ohne eigene Syntax)
id: 863
categories:
  - Web Development
date: "2013-02-25T17:37:52-05:00"
slug: view-template-klasse-php-syntax
---

Um meinen Lebenslauf etwas zu erweitern und interessanter zu machen, habe ich begonnen ein Spiel zu programmieren. Vor allem auf Basis von Javascript.

Hierum soll es in dem Beitrag allerdings nicht gehen, sondern um die **View Klasse** die ich dazu geschrieben habe. Mit Hilfe dieser Klasse kann man **Template** Dateien laden, die auf Basis von **PHP** arbeiten. Solche Klassen gibt es zuhauf, weshalb ich nur Kurz die Umgebungsvariablen beschreibe.

## Benutzung:

```php
<?php

// load template
$template = View::init('template');
$template->title: 'My title';

$content = View::init('subpage');
$content->set('contenttext', 'Bla');

$template->content = $view->render();
$template->display();
?>
```

## PHP Template Klasse (View):

```php
<?php

class View {

	/**
	 * View folder relative to APP_PATH
	 *
	 * @var string
	 */
	const VIEW_FOLDER = 'this/is/my/folder/to/the/views';

	/**
	 * Variables that have to be replaced in file
	 *
	 * @var array
	 */
	protected $_vars = array();

	/**
	 * String of the file + path
	 *
	 * @var string
	 */
	protected $_file = '';

	public function __construct($file, $vars = NULL) {

		// set vars
		if ($vars !== NULL) {
			$this->_vars = $vars + $this->_vars;
		}

		$this->_file = $file;
	}

	public static function init($file) {
		return new View($file);
	}

	/**
	 * Load complete filepath
	 *
	 * @param string $filename
	 * @throws View_Exception
	 * @return string complete filename
	 */
	private function load_file($filename) {

		// build filepath
		$fpath =  self::VIEW_FOLDER . DIRECTORY_SEPARATOR . $filename . '.php';

		if (!file_exists($fpath)) {
			throw new Eception('The file :file was not found',
					array(':file' => $fpath));
		}

		// return filename
		return $this->_file =  $fpath;
	}

	/**
	 * Assign a variable by name
	 *
	 * First you can set with string
	 * 	$view->set('title', 'Foo');
	 *
	 * You can also use an array
	 * 	$view->set(array('title' => 'Foo', 'copyright' => 'sBani'));
	 *
	 * @param mixed $key
	 * @param string $val
	 * @return View
	 * @return View
	 */
	public function set($key, $val = NULL) {

		if (is_array($key)) {

			foreach($key as $skey => $sval) {

				$this->_vars[$skey] = $sval;
			}

		} else {
			$this->_vars[$key] = $val;
		}

		return $this;
	}

	/**
	 * Magic method to get names
	 *
	 * @param string $name
	 * @return multitype:
	 * @return multitype:
	 */
	public function __get($name) {
		return $this->_vars[$name];
	}

	/**
	 * Magic method to set a var with [View::set]
	 *
	 * 	$view->title: 'Foo';
	 *
	 * @param mixed $key
	 * @param mixed $val
	 * @return Ambigous <string, mixed="">
	 * @return Ambigous <string, mixed="">
	 */
	public function __set($name, $val) {

		return $this->set($name, $val);
	}

	/**
	 * Magic method to unset a var key
	 *
	 * 	$this->title: 'Foo';
	 * 	unset($this->title);
	 *
	 * @param unknown_type $key
	 * @return return_type
	 */
	public function __unset($key) {
		unset($this->_vars[$key]);
	}

	/**
	 * Capture the output and edit vars
	 *
	 * @param string $filename
	 * @throws Exception
	 * @return string Output data with edited vars
	 * @return string
	 */
	protected function capture() {

		// extract view vars
		extract($this->_vars, EXTR_SKIP);

		// Capture the view output
		ob_start();

		try
		{
			// Load the view within the current scope
			include $this->_file;
		}
		catch (Exception $e)
		{
			// Delete the output buffer
			ob_end_clean();

			// Re-throw the exception
			throw $e;
		}

		// Get the captured output and close the buffer
		return ob_get_clean();
	}

	/**
	 * Load the file and get edited output
	 *
	 * @throws Exception
	 * @return string Output of view
	 */
	public function render() {

		// load filename
		$this->load_file($this->_file);

		return $this->capture();
	}

	/**
	 * Magic method, returns the output of [View::render].
	 *
	 * @return  string
	 * @uses    View::render
	 */
	public function __toString()
	{
		try {
			return $this->render();

		} catch(Exception $e) {
			throw $e;
		}
	}

	/**
	 * We render and print the output direktly
	 *
	 * @return void
	 */
	public function display() {

		echo $this->render();
	}
}
```
