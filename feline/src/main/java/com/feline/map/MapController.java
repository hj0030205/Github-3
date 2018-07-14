package com.feline.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/map")
public class MapController {

	ModelAndView mav = new ModelAndView();

	@RequestMapping(value="mapView.cat")
	public ModelAndView mapView() {
		
		mav.setViewName("mapView");
		return mav;
	}
}
