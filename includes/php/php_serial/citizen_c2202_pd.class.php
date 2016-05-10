<?php
/**
 * Citizen C2202-PD customer display control class
 *
 * @author R幦y Sanchez <thenux@gmail.com>
 * @copyright under GPL 2 licence
 */
class citizenC2202Pd extends phpSerial 
{
	function citizenC2202Pd($device)
	{
		$this->phpSerial();
		$this->setDevice($device);
	}
	
	/**
	 * Change the display mode to the overwrite mode. In this mode, the cursor will move rightward and
	 * begin from the upper left-end position. When the cursor reached the end of the upper line, the cursor
	 * will move down to the bottom left-end position to continue. When the cursor reached the end of the
	 * bottom line, it will move up to the upper left-end position and overwrite the previous characters.
	 *
	 * @return bool
	 */
	function _overwriteMode ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x11));
	}
	
	/**
	 * Change the display mode to the vertical scroll mode. In this mode, the cursor will move rightward.
	 * The cursor will begin from the upper left-end position until it reached the end of the upper line, the
	 * cursor will then move down to the bottom left-end position to continue until it reached the end of the
	 * bottom line. Then, C2202-PD will scroll the bottom line up to replace the upper line. The bottom line
	 * will be cleared, and the cursor will continue to the first position of the bottom line.
	 *
	 * @return bool
	 */
	function _verticalScrollMode ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x12));
	}
	
	/**
	 * Change the display mode to the horizontal mode. In this mode, the extend of the cursor activity is
	 * bond by predefined range, limited to the upper line. (Please refer to Set or cancel window command),
	 * where the default window is the whole upper line. Once the cursor activity reached the end of the
	 * range, the characters that comes there after will push displayed characters forward from behind.
	 * 
	 * @return bool
	 */
	function _horizontalScrollMode ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x13));
	}
	
	/**
	 * Display string (20 chars length) to the upper line
	 *
	 * @param string $str string to be displayed
	 * @return bool
	 */
	function _displayUpperLine ($str)
	{
		return $this->sendMessage(chr(0x1B) . chr(0x51) . chr(0x41) . $str . chr(0x0D));
	}
	
	/**
	 * Display string (20 chars length) to the lower line
	 *
	 * @param string $str string to be displayed
	 * @return bool
	 */
	function _displayLowerLine ($str)
	{
		return $this->sendMessage(chr(0x1B) . chr(0x51) . chr(0x42) . $str . chr(0x0D));
	}
	
	/**
	 * Makes the upper line scroll until a new command is sent
	 *
	 * @param string $str string to be scrolled
	 * @return bool
	 */
	function _scrollUpperLine ($str)
	{
		return $this->sendMessage(chr(0x1B) . chr(0x51) . chr(0x44) . $str . chr(0x0D));
	}
	
	/**
	 * Moves the cursor to the left
	 *
	 * @return bool
	 */
	function _moveCursorLeft ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5B) . chr(0x44));
	}
	
	/**
	 * Moves the cursor to the right position
	 *
	 * @return bool
	 */
	function _moveCursorRight ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5B) . chr(0x43));
	}
	
	/**
	 * Moves the cursor up
	 *
	 * @return bool
	 */
	function _moveCursorUp ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5B) . chr(0x41));
	}
	
	function _moveCursorDown ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5B) . chr(0x42));
	}
	
	/**
	 * Moves the cursor to the home position (left-end position of the upper line)
	 *
	 * @return bool
	 */
	function _moveCursorHome ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5B) . chr(0x48));
	}
	
	/**
	 * Moves the cursor to the left-end position
	 *
	 * @return bool
	 */
	function _moveCursorLeftMost ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5B) . chr(0x4C));
	}
	
	/**
	 * Moves the cursor to the right-end position
	 *
	 * @return bool
	 */
	function _moveCursorRightMost ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5B) . chr(0x52));
	}
	
	/**
	 * Moves the cursor to the bottom position
	 *
	 * @return bool
	 */
	function _moveCursorBottom ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5B) . chr(0x4B));
	}
	
	/**
	 * Moves the cursor to the specified position
	 *
	 * @param int $x 1 <= row number <= 20
	 * @param int $y 1 <= line number <= 2
	 * @return bool
	 */
	function _moveCursorTo ($x, $y)
	{
		if ($x > 20) $x = 20;
		elseif ($x < 1) $x = 1;
		
		if ($y > 2) $y = 2;
		elseif ($y < 1) $y = 1;
		
		return $this->sendMessage(chr(0x1B) . chr(0x6C) . chr($x) . chr($y));
	}
	
	/**
	 * Everything will be cleared and set to the default value
	 *
	 * @return bool
	 */
	function _initializeDisplay ()
	{
		return $this->sendMessage(chr(0x1B) . chr(0x40));
	}
	
	function _setWindow ($active, $start = 1, $stop = 20, $line = 1)
	{
		if ($line > 2) $line = 2;
		elseif ($line < 1) $line = 1;
		
		if ($start > 20) $start = 20;
		elseif ($start < 0) $start = 1;
		
		if ($stop > 20) $stop = 20;
		elseif ($stop < 0) $stop = 1;
		
		if ($start >= $stop and $start != 20) $stop = $start+1;
		elseif ($start >= $stop) $start = 19;
			
		return $this->sendMessage(chr(0x1B) . chr(0x57) . chr((bool) $active) . chr($start) . chr($stop) . chr($line));
	}
	
	/**
	 * Clears the display and the string mode
	 *
	 * @return bool
	 */
	function _clearDisplay ()
	{
		return $this->sendMessage(chr(0x0C));
	}
	
	/**
	 * Clears the line of the cursor
	 *
	 * @return bool
	 */
	function _clearLine ()
	{
		return $this->sendMessage(chr(0x18));
	}
	
	/**
	 * Sets the brightness
	 *
	 * @param unknown_type $value
	 * @return unknown
	 */
	function _setBrightness ($value)
	{
		if ($value > 4) $value = 4;
		elseif ($value < 1) $value = 1;
		
		return $this->sendMessage(chr(0x1B) . chr(0x2A) . chr($value));
	}
	
	/**
	 * Define one of more custom character
	 *
	 * @param int $firstchar first char's number
	 * @param int $lastchar last chars's number
	 * @param array $draw chars map
	 * @return bool
	 */
	function _defineUserChars ($firstchar, $lastchar, $draw = array())
	{
		$char = "";
		
		foreach ($draw as $value)
		{
			$char .= chr((bool) $value);
		}
		
		return $this->sendMessage(chr(0x1B) . chr(0x26) . chr(0x01) . chr($firstchar) . chr($lastchar) . $char);
	}
	
	function _setCursor ($state)
	{
		return $this->sendMessage(chr(0x1B) . chr(0x5F) . chr((bool) $state));
	}
	
	function write ($str)
	{
		return $this->sendMessage($str);
	}
	
	/**
	 * Scroll a message on the display
	 *
	 * @param string $str     string to be scrolled. No length limit
	 * @param int $frequency  number of letters to move per second
	 * @param int $aftersleep time to sleep after having displayed the message
	 * @return bool
	 */
	function scrollUpperLine ($str, $frequency = 5, $aftersleep = 1)
	{
		$period = intval((1/$frequency)*1000000);
		$len = strlen($str);
		
		$this->_horizontalScrollMode();
		$this->_clearLine();
		
		for ($i=0; $i<$len; $i++)
		{
			$this->write($str{$i});
			usleep($period);
		}
		
		sleep($aftersleep);
		
		return true;
	}
}
?>