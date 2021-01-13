-- (c) Platin21
-- 2016.12.7
-- version: Beta
--
function PG(cls)

	function ERROR(v)
		print('Error:'..v);
	end

	local this = {};
	local _HWD_IMAGE = {};
	local _HWD_IMAGE_COUNT = 1;
	local _HWD_IMAGE_VALUE = 1;
	local _HWD_IMAGE_SIZE_W = 0;
	local _HWD_IMAGE_SIZE_H = 0; 
	local _HWD_IMAGE_COLOR = 0;
	local _HWD_ACTUAL_IMAGE = 1;
	local _HWD_IMAGE_CLEAR_COLOR = cls;
	local _HWD_IMAGE_COLOR_BACKGROUND = 0;
	local _HWD_IMAGE_COLOR_TABLE = {};
	
	_HWD_IMAGE_COLOR_TABLE[#_HWD_IMAGE_COLOR_TABLE + 1] = 1;
	local clr = 1;
	for i=0,14 do
		clr = clr * 2;
		_HWD_IMAGE_COLOR_TABLE[#_HWD_IMAGE_COLOR_TABLE + 1] = clr;
	end
	clr = nil;
	
	function this._HWD_SET_CLEAR_COLOR(c)
		if type(c) == "number" then 
			if c_7834239045(c) then 
				_HWD_IMAGE_COLOR = c;
			else
				-- TODO: ERROR FUNCTION
			end
		else
			-- TODO: ERROR FUNCTION
		end
	end

	function c_2162069189()
		
	end
	function c_4162362989(c)
		if c == "0" then
			return _HWD_IMAGE_COLOR_TABLE[1];
		elseif c == "1" then
			return _HWD_IMAGE_COLOR_TABLE[2];
		elseif c == "2" then
			return _HWD_IMAGE_COLOR_TABLE[3];
		elseif c == "3" then
			return _HWD_IMAGE_COLOR_TABLE[4];
		elseif c == "4" then
			return _HWD_IMAGE_COLOR_TABLE[5];
		elseif c == "5" then
			return _HWD_IMAGE_COLOR_TABLE[6];
		elseif c == "6" then
			return _HWD_IMAGE_COLOR_TABLE[7];
		elseif c == "7" then
			return _HWD_IMAGE_COLOR_TABLE[8];
		elseif c == "8" then
			return _HWD_IMAGE_COLOR_TABLE[9];
		elseif c == "9" then
			return _HWD_IMAGE_COLOR_TABLE[10];
		elseif c == "a" then
			return _HWD_IMAGE_COLOR_TABLE[11];
		elseif c == "b" then
			return _HWD_IMAGE_COLOR_TABLE[12];
		elseif c == "c" then
			return _HWD_IMAGE_COLOR_TABLE[13];
		elseif c == "d" then
			return _HWD_IMAGE_COLOR_TABLE[14];
		elseif c == "e" then
			return _HWD_IMAGE_COLOR_TABLE[15];
		elseif c == "f" then
			return _HWD_IMAGE_COLOR_TABLE[16];
		else
			-- TODO: ERROR FUNCTION
			print("TESTVALUE:",c);
		end		
	end
	function CREATE_BUFFER()
		_HWD_IMAGE[_HWD_IMAGE_VALUE] = {};
		for h = 0,_HWD_IMAGE_SIZE_H do
			_HWD_IMAGE[_HWD_IMAGE_VALUE][h] = {};
			for w = 0,_HWD_IMAGE_SIZE_W do 
				_HWD_IMAGE[_HWD_IMAGE_VALUE][h][w] = "1".._HWD_IMAGE_CLEAR_COLOR.." ";
			end
		end
		_HWD_IMAGE_VALUE = _HWD_IMAGE_VALUE + 1;	
	end
	-- GET COLOR OUT OF SEGMENT
	function c_3657831591(segment)
			_HWD_IMAGE_COLOR = c_4162362989(string.sub(segment,2,2)) or 1;
	end
	function c_3658832511(segment)
			_HWD_IMAGE_COLOR_BACKGROUND = c_4162362989(string.sub(segment,1,1)) or 1;
	end
	-- GET COLOR OUT OF SEGMENT
	function c_7834239045(e)
		for i=1,16 do
			if e == _HWD_IMAGE_COLOR_TABLE[i] then 
				return true;
			end	
		end
		return false;
	end
	
	
	
	function this._HWD_IMAGE_WIDHT(w)
		if w ~= 0 then 
			_HWD_IMAGE_SIZE_W = w;
		else
			-- TODO: ERROR FUNCTION
		end
	end
	
	function this._HWD_IMAGE_HEIGHT(h)
		if h ~= 0 then 
			_HWD_IMAGE_SIZE_H = h;
		else
			-- TODO: ERROR FUNCTION
		end
	end

	function this._HWD_IMAGE_GET_HEIGHT()
		return _HWD_IMAGE_HEIGHT;
	end
	function this._HWD_IMAGE_GET_WIDHT()
		return _HWD_IMAGE_HEIGHT;
	end

	function this._HWD_CREATE_IMAGE()
		_HWD_IMAGE_COUNT = _HWD_IMAGE_COUNT + 1;
	end
	
	function this._HWD_CREATE_IMAGE_BUFFER()
		if _HWD_IMAGE_VALUE == _HWD_IMAGE_COUNT then
			ERROR("Call _HWD_CREATE_IMAGE");
		else
			if type(_HWD_IMAGE_SIZE_H) == "number" and type(_HWD_IMAGE_SIZE_W) == "number" then  
				if _HWD_IMAGE_SIZE_H > 1 and _HWD_IMAGE_SIZE_W > 1 then
					CREATE_BUFFER();
				else
					ERROR(" Invalid size or size not set")
				end
			else
				ERROR(" Invalid type or size not set")
			end
		end
	end
	
	function this._HWD_IMAGE_PLOT(x,y,c)
		if y < _HWD_IMAGE_SIZE_H and x < _HWD_IMAGE_SIZE_W then 
			_HWD_IMAGE[_HWD_ACTUAL_IMAGE][y][x] = c; 
		end
	end

	function short(_1,_2)
		if _1 < _2 then
			return 1;
		else
			return -1;
		end
	end

	function draw(h,x,y)
		c_3657831591(h);
		c_3658832511(h);
		if string.sub(h,3,3) == " " then 
			paintutils.drawPixel(x,y,_HWD_IMAGE_COLOR);
		else
			term.setTextColor(_HWD_IMAGE_COLOR);
			term.setBackgroundColor(_HWD_IMAGE_COLOR_BACKGROUND);
			term.setCursorPos(x,y);
			term.write(string.sub(h,3,3));

			term.setTextColor(1);
			term.setBackgroundColor(_HWD_IMAGE_CLEAR_COLOR);
		end
	end

	function this._HWD_IMAGE_LINE( x0,y0,x1,y1,c,cb)
		local dx = math.abs( x1 - x0 );
		local sx = short(x0,x1);
		local dy = -math.abs( y1 - y0 );
		local sy = short(y0,y1);
		local err = dx+dy;
		local e2;
		while true do
			this._HWD_IMAGE_PLOT(x0,y0,c..cb..' ');
			if x0 == x1 and y0 == y1 then break; end
			e2 = 2*err;
			if e2 > dy then err = err + dy; x0 = x0 + sx; end
			if e2 < dx then err = err + dx; y0 = y0 + sy; end    
		end
	end

	function this._HWD_IMAGE_SAFE_PLOT(x,y,c)
		if y < _HWD_IMAGE_SIZE_H and x < _HWD_IMAGE_SIZE_W then 
			_HWD_IMAGE[_HWD_ACTUAL_IMAGE][y][x] = c; 
		else
			ERROR(" x="..x.." y="..y.." is not in Screen");
		end
	end

	function this._HWD_IMAGE_SWAP()
		if _HWD_IMAGE_COUNT-1 == _HWD_ACTUAL_IMAGE then 
			_HWD_ACTUAL_IMAGE = 1;
		else
			_HWD_ACTUAL_IMAGE = _HWD_ACTUAL_IMAGE + 1;
		end
	end

	function this.test()
		
	end
	
	function this._HWD_IMAGE_DRAW()
		for y=1,_HWD_IMAGE_SIZE_H do
			local bf = "";
			for x=1,_HWD_IMAGE_SIZE_W do
				draw(_HWD_IMAGE[_HWD_ACTUAL_IMAGE][y][x],x,y)
			end
		end
	end

	function this._HWD_IMAGE_PRINT(T,colorF,colorB)
		for i=1,#T do
			this._HWD_IMAGE_PLOT(i,1,colorF..colorB..string.sub(T,i,i));
		end
	end

	return this;
end

local pg = PG('2');
pg._HWD_IMAGE_HEIGHT(15);
pg._HWD_IMAGE_WIDHT(21);
pg._HWD_CREATE_IMAGE();
pg._HWD_CREATE_IMAGE_BUFFER();
pg._HWD_CREATE_IMAGE();
pg._HWD_CREATE_IMAGE_BUFFER();
pg._HWD_IMAGE_LINE(1,1,4,4,'a','a');
pg._HWD_IMAGE_LINE(4,4,5,9,'c','c');
pg._HWD_IMAGE_PRINT("ARMIN",'c','3');
	
pg._HWD_IMAGE_DRAW();
pg._HWD_IMAGE_SWAP();
pg._HWD_IMAGE_LINE(1,1,4,4,'e','7');
pg._HWD_IMAGE_LINE(4,4,5,9,'c','4');
pg._HWD_IMAGE_PRINT("ARMIN TERZ TERZ",'d','3');

while true do 
	pg._HWD_IMAGE_SWAP();
	pg._HWD_IMAGE_DRAW();
	sleep(0.5)
end
