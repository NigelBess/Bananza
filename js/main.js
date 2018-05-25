var menus = document.getElementsByClassName("menu");
var dropdowns = document.getElementsByClassName("dropdown");
var menuOpen = false;
var currentMenu;
var mouseOverDropDown = false;
var mouseOverMenu = false;
for (i=0; i<menus.length;i++)
{
	menus[i].addEventListener("click",openMenu);
	menus[i].onmouseover = function(){mouseOverMenu = true;}
	menus[i].onmouseout = function(){mouseOverMenu = false;}


}
for (i=0;i<dropdowns.length;i++)
{
	dropdowns[i].onmouseover = function(){ mouseOverDropDown = true;}
	dropdowns[i].onmouseout = function(){mouseOverDropDown = false;}
}



function openMenu()
{	
	if(!menuOpen || (currentMenu!=this))
	{
		for (i=0;i<dropdowns.length;i++)
			{
				if(dropdowns[i].parentNode == this)
				{	
					dropdowns[i].classList.add("active");
					menuOpen = true;
				}
				if (dropdowns[i].parentNode != this)
				{
					dropdowns[i].classList.remove("active");
				}
			}
	} else if (!mouseOverDropDown && (currentMenu==this))
	{	
		closeAll();
	}
		currentMenu = this;
}

window.onclick = function(event)
{	
	if (menuOpen && !mouseOverMenu)
		{	
			closeAll();
		}
}
function closeAll()
{	
	for(i=0;i<dropdowns.length;i++)
	{
		if (dropdowns[i].classList.contains("active"))
		{
			dropdowns[i].classList.remove("active");
		}

	}
	menuOpen = false;
}