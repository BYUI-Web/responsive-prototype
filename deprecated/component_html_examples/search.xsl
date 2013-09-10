<!-- *** START OF STYLESHEET *** -->

<!-- **********************************************************************
 XSL to format the search output for Google Search Appliance
     ********************************************************************** -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- **********************************************************************
 include customer-onebox.xsl, which is auto-generated from the customer's
 set of OneBox Module definitions, and in turn invokes either the default
 OneBox template, or the customer's:
********************************************************************** -->
<xsl:include href="customer-onebox.xsl"/>

<xsl:output method="html"/>

<!-- **********************************************************************
 Logo setup (can be customized)
     - whether to show logo: 0 for FALSE, 1 (or non-zero) for TRUE
     - logo url
     - logo size: '' for default image size
     ********************************************************************** -->
<xsl:variable name="show_logo">0</xsl:variable>
<xsl:variable name="logo_url">http://beta.byui.edu/images/common/byui-i.png</xsl:variable>
<xsl:variable name="logo_width">0</xsl:variable>
<xsl:variable name="logo_height">0</xsl:variable>

<!-- **********************************************************************
 Global Style variables (can be customized): '' for using browser's default
     ********************************************************************** -->

<xsl:variable name="global_font">Helvetica, Arial, sans-serif</xsl:variable>
<xsl:variable name="global_font_size"></xsl:variable>
<xsl:variable name="global_bg_color">#ffffff</xsl:variable>
<xsl:variable name="global_text_color">#333333</xsl:variable>
<xsl:variable name="global_link_color">#333333</xsl:variable>
<xsl:variable name="global_vlink_color">#333333</xsl:variable>
<xsl:variable name="global_alink_color">#333333</xsl:variable>


<!-- **********************************************************************
 Result page components (can be customized)
     - whether to show a component: 0 for FALSE, non-zero (e.g., 1) for TRUE
     - text and style
     ********************************************************************** -->

<!-- *** choose result page header: '', 'provided', 'mine', or 'both' *** -->
<xsl:variable name="choose_result_page_header">both</xsl:variable>

<!-- *** customize provided result page header *** -->
<xsl:variable name="show_swr_link">0</xsl:variable>
<xsl:variable name="swr_search_anchor_text">Search Within Results</xsl:variable>
<xsl:variable name="show_result_page_adv_link">1</xsl:variable>
<xsl:variable name="adv_search_anchor_text">BYU-Idaho Advanced Search</xsl:variable>
<xsl:variable name="show_result_page_help_link">1</xsl:variable>
<xsl:variable name="search_help_anchor_text">Search Tips</xsl:variable>
<xsl:variable name="show_alerts_link">0</xsl:variable>
<xsl:variable name="alerts_anchor_text">Alerts</xsl:variable>

<!-- *** search boxes *** -->
<xsl:variable name="show_top_search_box">1</xsl:variable>
<xsl:variable name="show_bottom_search_box">1</xsl:variable>
<xsl:variable name="search_box_size">32</xsl:variable>

<!-- *** choose search button type: 'text' or 'image' *** -->
<xsl:variable name="choose_search_button">text</xsl:variable>
<xsl:variable name="search_button_text">Search</xsl:variable>
<xsl:variable name="search_button_image_url"></xsl:variable>
<xsl:variable name="search_collections_xslt"></xsl:variable>

<!-- *** search info bars *** -->
<xsl:variable name="show_search_info">1</xsl:variable>

<!-- *** choose separation bar: 'ltblue', 'blue', 'line', 'nothing' *** -->
<xsl:variable name="choose_sep_bar">ltblue</xsl:variable>
<xsl:variable name="sep_bar_std_text">BYU-Idaho Search</xsl:variable>
<xsl:variable name="sep_bar_adv_text">BYU-Idaho Advanced Search</xsl:variable>
<xsl:variable name="sep_bar_error_text">Error</xsl:variable>

<!-- *** navigation bars: '', 'google', 'link', or 'simple'*** -->
<xsl:variable name="show_top_navigation">1</xsl:variable>
<xsl:variable name="choose_bottom_navigation">link</xsl:variable>
<xsl:variable name="my_nav_align">right</xsl:variable>
<xsl:variable name="my_nav_size">-1</xsl:variable>
<xsl:variable name="my_nav_color">#6f6f6f</xsl:variable>

<!-- *** sort by date/relevance *** -->
<xsl:variable name="show_sort_by">1</xsl:variable>

<!-- *** spelling suggestions *** -->
<xsl:variable name="show_spelling">1</xsl:variable>
<xsl:variable name="spelling_text">Did you mean:</xsl:variable>
<xsl:variable name="spelling_text_color"><strong>#c35c00</strong></xsl:variable>

<!-- *** synonyms suggestions *** -->
<xsl:variable name="show_synonyms">1</xsl:variable>
<xsl:variable name="synonyms_text">You could also try:</xsl:variable>
<xsl:variable name="synonyms_text_color">#c35c00</xsl:variable>

<!-- *** keymatch suggestions *** -->
<xsl:variable name="show_keymatch">1</xsl:variable>
<xsl:variable name="keymatch_text">KeyMatch</xsl:variable>
<xsl:variable name="keymatch_text_color">#333333</xsl:variable>
<xsl:variable name="keymatch_bg_color">#E8EDFF</xsl:variable>

<!-- *** Google Desktop integration *** -->
<xsl:variable name="egds_show_search_tabs">1</xsl:variable>
<xsl:variable name="egds_appliance_tab_label">Appliance</xsl:variable>
<xsl:variable name="egds_show_desktop_results">1</xsl:variable>

<!-- *** onebox information *** -->
<xsl:variable name="show_onebox">1</xsl:variable>

<!-- *** analytics information *** -->
<xsl:variable name="analytics_account"></xsl:variable>

<!-- **********************************************************************
 Result elements (can be customized)
     - whether to show an element ('1' for yes, '0' for no)
     - font/size/color ('' for using style of the context)
     ********************************************************************** -->

<!-- *** result title and snippet *** -->
<xsl:variable name="show_res_title">1</xsl:variable>
<xsl:variable name="res_title_color">#333333</xsl:variable>
<xsl:variable name="res_title_size"></xsl:variable>
<xsl:variable name="show_res_snippet">1</xsl:variable>
<xsl:variable name="res_snippet_size">80%</xsl:variable>

<!-- *** keyword match (in title or snippet) *** -->
<xsl:variable name="res_keyword_color"></xsl:variable>
<xsl:variable name="res_keyword_size"></xsl:variable>
<xsl:variable name="res_keyword_format">strong</xsl:variable> <!-- 'b' for bold -->

<!-- *** link URL *** -->
<xsl:variable name="show_res_url">1</xsl:variable>
<xsl:variable name="res_url_color">#3A6FA9</xsl:variable>
<xsl:variable name="res_url_size">-1</xsl:variable>
<xsl:variable name="truncate_result_urls">1</xsl:variable>
<xsl:variable name="truncate_result_url_length">100</xsl:variable>

<!-- *** misc elements *** -->
<xsl:variable name="show_meta_tags">0</xsl:variable>
<xsl:variable name="show_res_size">1</xsl:variable>
<xsl:variable name="show_res_date">1</xsl:variable>
<xsl:variable name="show_res_cache">0</xsl:variable>

<!-- *** used in result cache link, similar pages link, and description *** -->
<xsl:variable name="faint_color">#3A6FA9</xsl:variable>

<!-- *** show secure results radio button *** -->
<xsl:variable name="show_secure_radio">0</xsl:variable>

<!-- **********************************************************************
 Other variables (can be customized)
     ********************************************************************** -->

<!-- *** page title *** -->
<xsl:variable name="front_page_title">BYU-Idaho Search Home</xsl:variable>
<xsl:variable name="result_page_title">BYU-I Search Results</xsl:variable>
<xsl:variable name="adv_page_title">BYU-I Advanced Search</xsl:variable>
<xsl:variable name="error_page_title">Error</xsl:variable>
<xsl:variable name="swr_page_title">BYU-I Search Within Results</xsl:variable>

<!-- *** choose adv_search page header: '', 'provided', 'mine', or 'both' *** -->
<xsl:variable name="choose_adv_search_page_header">both</xsl:variable>

<!-- *** cached page header text *** -->
<xsl:variable name="cached_page_header_text">This is the cached copy of</xsl:variable>

<!-- *** error message text *** -->
<xsl:variable name="server_error_msg_text">A server error has occurred.</xsl:variable>
<xsl:variable name="server_error_des_text">Check server response code in details.</xsl:variable>
<xsl:variable name="xml_error_msg_text">Unknown XML result type.</xsl:variable>
<xsl:variable name="xml_error_des_text">View page source to see the offending XML.</xsl:variable>

<!-- *** advanced search page panel background color *** -->
<xsl:variable name="adv_search_panel_bgcolor">#cbdced</xsl:variable>

<!-- *** dyanmic result cluster options *** -->
<xsl:variable name="show_res_clusters">0</xsl:variable>
<xsl:variable name="res_cluster_position">right</xsl:variable>

<!-- **********************************************************************
 My global page header/footer [body added] (can be customized)
     ********************************************************************** -->
<xsl:template name="my_page_header">
  <!-- *** replace the following with your own xhtml code or replace the text
   between the xsl:text tags with html escaped html code *** -->
  <xsl:text disable-output-escaping="yes">
&lt;!doctype html&gt;
&lt;!--[if IE]&gt;&lt;![endif]--&gt;
&lt;!--[if lt IE 7 ]&gt; &lt;html lang=&quot;en&quot; class=&quot;no-js ie6&quot;&gt; &lt;![endif]--&gt;
&lt;!--[if IE 7 ]&gt;    &lt;html lang=&quot;en&quot; class=&quot;no-js ie7&quot;&gt; &lt;![endif]--&gt;
&lt;!--[if IE 8 ]&gt;    &lt;html lang=&quot;en&quot; class=&quot;no-js ie8&quot;&gt; &lt;![endif]--&gt;
&lt;!--[if IE 9 ]&gt;    &lt;html lang=&quot;en&quot; class=&quot;no-js ie9&quot;&gt; &lt;![endif]--&gt;
&lt;!--[if (gt IE 9)|!(IE)]&gt;&lt;!--&gt;&lt;html lang=&quot;en&quot; class=&quot;no-js&quot;&gt; &lt;!--&lt;![endif]--&gt;
&lt;head&gt;
	&lt;meta charset=&quot;utf-8&quot;&gt;

	&lt;title&gt;Brigham Young University - Idaho&lt;/title&gt;
	&lt;meta name=&quot;description&quot; content=&quot;&quot;&gt;
    &lt;meta name=&quot;author&quot; content=&quot;Brigham Young University-Idaho&quot;&gt;

	&lt;!-- Mobile viewport optimized: j.mp/bplateviewport --&gt;
    &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width,initial-scale=1&quot;&gt;
	&lt;link rel=&quot;icon&quot; href=&quot;http://www.byui.edu/search/googlemini2/favicon.ico&quot; /&gt;
    
    
	
&lt;/head&gt;
  
  </xsl:text>
  </xsl:template>     

<xsl:template name="my_page_body">
  <!-- *** replace the following with your own xhtml code or replace the text
   between the xsl:text tags with html escaped html code *** -->
  <xsl:text disable-output-escaping="yes"> &lt;!-- Please enter html code below. --&gt;

  <!-- BYU-I web page header -->

&lt;body id=&quot;search&quot;&gt;&lt;!-- Body tag must have page template name in it to inherit template-specific css rules --&gt;
	&lt;div class=&quot;container&quot;&gt;
		&lt;header&gt;
			&lt;div id=&quot;top_header&quot; class=&quot;margin_bleed&quot;&gt;
				&lt;nav id=&quot;main_nav&quot; class=&quot;span-17&quot;&gt;
					&lt;ul&gt;
						&lt;li class=&quot;first&quot;&gt;
							&lt;a href=&quot;http://beta.byui.edu/&quot;&gt;Home&lt;/a&gt;
						&lt;/li&gt;
						&lt;li&gt;
							&lt;a href=&quot;http://www.byui.edu/about/&quot;&gt;About BYUI&lt;/a&gt;
						&lt;/li&gt;
						&lt;li&gt;
							&lt;a href=&quot;http://www.byui.edu/about/academics/&quot;&gt;Academics&lt;/a&gt;&lt;/li&gt;
							&lt;li&gt;
								&lt;a href=&quot;http://www.byui.edu/about/student-life/&quot;&gt;Student Life&lt;/a&gt;
							&lt;/li&gt;
							&lt;li class=&quot;last&quot;&gt;
								&lt;a href=&quot;http://www.byui.edu/contact-us/&quot;&gt;Contact BYUI&lt;/a&gt;
							&lt;/li&gt;
						&lt;/ul&gt;
					&lt;/nav&gt;
				&lt;/div&gt;
			&lt;div id=&quot;main_header&quot; class=&quot;margin_bleed&quot;&gt;
				&lt;div class=&quot;span-2&quot;&gt;
					&lt;a href=&quot;http://beta.byui.edu&quot;&gt;&lt;img src=&quot;http://beta.byui.edu/prebuilt/stylenew/images/head/byuilogo.png&quot; alt=&quot;&quot; height=&quot;41&quot; width=&quot;70&quot; /&gt;&lt;/a&gt;
				&lt;/div&gt;
				&lt;div class=&quot;span-9&quot;&gt;
					&lt;h1 id=&quot;university_name&quot;&gt;&lt;a href=&quot;http://beta.byui.edu&quot;&gt;Brigham Young University - Idaho&lt;/a&gt;&lt;/h1&gt;
				&lt;/div&gt;
				&lt;nav id=&quot;audience_nav_box&quot; class=&quot;span-13 last&quot;&gt;
					&lt;ul&gt;
						&lt;li class=&quot;first&quot;&gt;&lt;a href=&quot;http://www.byui.edu/students&quot;&gt;Students&lt;/a&gt;&lt;/li&gt;
						&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/prepare&quot;&gt;Future Students&lt;/a&gt;&lt;/li&gt;
						&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/parents&quot;&gt;Parents&lt;/a&gt;&lt;/li&gt;
						&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/employees&quot;&gt;Employees&lt;/a&gt;&lt;/li&gt;
						&lt;li&gt;&lt;a href=&quot;http://www.byuiconnect.com/&quot;&gt;Alumni&lt;/a&gt;&lt;/li&gt;
						&lt;li class=&quot;last&quot;&gt;&lt;a href=&quot;http://beta.byui.edu/vistors&quot;&gt;Visitors&lt;/a&gt;&lt;/li&gt;	
					&lt;/ul&gt;
				&lt;/nav&gt;
				&lt;div id=&quot;search_box&quot; class=&quot;span-7 last&quot;&gt;
				&lt;nav&gt;
					&lt;ul&gt;
						&lt;li class=&quot;first&quot;&gt;
							&lt;a href=&quot;http://www.byui.edu/site-index/&quot;&gt;A-Z Index&lt;/a&gt;
						&lt;/li&gt;
						&lt;li&gt;
							&lt;a href=&quot;http://www.byui.edu/ask/live-chat/&quot; target=&quot;_blank&quot;&gt;
								&lt;span class=&quot;italics&quot;&gt;Ask&lt;/span&gt;
								&lt;strong&gt;BYUI&lt;/strong&gt;
							&lt;/a&gt;
						&lt;/li&gt;
						&lt;li&gt;
							&lt;a href=&quot;http://m.byui.edu/&quot;&gt;Mobile Tools&lt;/a&gt;
						&lt;/li&gt;
						&lt;li class=&quot;last&quot;&gt;
							&lt;a href=&quot;https://my.byui.edu/&quot;&gt;									&lt;span class=&quot;italics&quot;&gt;my&lt;/span&gt;&lt;strong&gt;BYUI&lt;/strong&gt;
							&lt;/a&gt;
						&lt;/li&gt;
					&lt;/ul&gt;
				&lt;/nav&gt;
				&lt;div id=&quot;search_wrapper&quot;&gt;
					&lt;form method=&quot;get&quot; action=&quot;http://search.byui.edu/search?&quot;&gt;
						&lt;input type=&quot;text&quot; class=&quot;search_box&quot; name=&quot;q&quot;&gt;
						&lt;input type=&quot;image&quot; src=&quot;http://beta.byui.edu/prebuilt/stylenew/head/blankimg.png&quot; class=&quot;search_box_submit&quot; alt=&quot;Submit Search&quot;&gt;
						&lt;input type=&quot;hidden&quot; name=&quot;site&quot; value=&quot;default_collection&quot;&gt;
						&lt;input type=&quot;hidden&quot; name=&quot;client&quot; value=&quot;beta_frontend&quot;&gt;
						&lt;input type=&quot;hidden&quot; name=&quot;output&quot; value=&quot;xml_no_dtd&quot;&gt;
						&lt;input type=&quot;hidden&quot; name=&quot;proxystylesheet&quot; value=&quot;beta_frontend&quot;&gt;&lt;input type=&quot;hidden&quot; name=&quot;proxyreload&quot; value=&quot;0&quot;&gt;
						&lt;/form&gt;
					&lt;/div&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		&lt;/header&gt;
		&lt;span class=&quot;clearall&quot;&gt;&lt;/span&gt;

 <!-- BYU-I web page header END -->

</xsl:text>
</xsl:template>

<xsl:template name="my_page_footer">
  <!--<span class="p">-->
    <xsl:text disable-output-escaping="yes"> &lt;!-- Please enter html code below. --&gt;
    
 <!-- BYU-I footer -->
 
     	&lt;footer id=&quot;mega_footer&quot;&gt;
			&lt;div id=&quot;footer_graphic&quot; class=&quot;margin_bleed&quot;&gt;
				&lt;div&gt;&lt;/div&gt;
			&lt;/div&gt;
			&lt;div id=&quot;footer_nav&quot; class=&quot;margin_bleed&quot;&gt;&lt;nav id=&quot;audience_nav_box_bottom&quot; class=&quot;span-16&quot;&gt;&lt;ul&gt;&lt;li class=&quot;first&quot;&gt;&lt;a href=&quot;http://www.byui.edu/students/&quot;&gt;Students&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/future-students/&quot;&gt;Future Students&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/parents/&quot;&gt;Parents&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/employees/&quot;&gt;Employees&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/alumni/&quot;&gt;Alumni&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;last&quot;&gt;&lt;a href=&quot;http://www.byui.edu/visitors/&quot;&gt;Visitors&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/nav&gt;&lt;div id=&quot;search_box_bottom&quot; class=&quot;span-7 last&quot;&gt;&lt;nav&gt;&lt;ul&gt;&lt;li class=&quot;first&quot;&gt;&lt;a href=&quot;http://www.byui.edu/site-index/&quot;&gt;A-Z Index&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/ask/live-chat/&quot; target=&quot;_blank&quot;&gt;&lt;span class=&quot;italics&quot;&gt;Ask&lt;/span&gt;&lt;strong&gt;BYUI&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://m.byui.edu/&quot;&gt;Mobile Tools&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;last&quot;&gt;&lt;a href=&quot;https://my.byui.edu/&quot;&gt;&lt;span class=&quot;italics&quot;&gt;my&lt;/span&gt;&lt;strong&gt;BYUI&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/nav&gt;&lt;div id=&quot;search_wrapper_bottom&quot;&gt;&lt;form method=&quot;get&quot; action=&quot;http://search.byui.edu/search?&quot;&gt;&lt;input type=&quot;text&quot; class=&quot;search_box&quot; name=&quot;q&quot;&gt;&lt;input type=&quot;image&quot; src=&quot;http://beta.byui.edu/prebuilt/stylenew/images/head/blankimg.png&quot; class=&quot;search_box_submit&quot; alt=&quot;Submit Search&quot;&gt;&lt;input type=&quot;hidden&quot; name=&quot;site&quot; value=&quot;default_collection&quot;&gt;&lt;input type=&quot;hidden&quot; name=&quot;client&quot; value=&quot;beta_frontend&quot;&gt;&lt;input type=&quot;hidden&quot; name=&quot;output&quot; value=&quot;xml_no_dtd&quot;&gt;&lt;input type=&quot;hidden&quot; name=&quot;proxystylesheet&quot; value=&quot;beta_frontend&quot;&gt;&lt;input type=&quot;hidden&quot; name=&quot;proxyreload&quot; value=&quot;0&quot;&gt;&lt;/form&gt;&lt;/div&gt;&lt;/div&gt;&lt;nav id=&quot;secondary_nav&quot; class=&quot;span-8 last&quot;&gt;&lt;ul&gt;&lt;li class=&quot;first&quot;&gt;&lt;a href=&quot;http://www.byui.edu/site-index/&quot;&gt;A-Z Index&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/ask/live-chat/&quot; target=&quot;_blank&quot;&gt;&lt;span class=&quot;italics&quot;&gt;Ask&lt;/span&gt;&lt;strong&gt;BYUI&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://m.byui.edu/&quot;&gt;Mobile Tools&lt;/a&gt;&lt;/li&gt;&lt;li class=&quot;last&quot;&gt;&lt;a href=&quot;https://my.byui.edu/&quot;&gt;&lt;span class=&quot;italics&quot;&gt;my&lt;/span&gt;&lt;strong&gt;BYUI&lt;/strong&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/nav&gt;&lt;/div&gt;

&lt;div id=&quot;footer_links_container&quot; class=&quot;margin_bleed&quot;&gt;&lt;nav id=&quot;footer_links&quot;&gt;&lt;div class=&quot;span-6 link_list box-shadow&quot;&gt;&lt;h4&gt;Popular Links&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/directories/colleges-and-departments/&quot;&gt;Academic Programs&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/activities/&quot;&gt;Activities&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/Admissions/&quot;&gt;Admissions&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://web.byui.edu/BulletinBoard2/&quot;&gt;Bulletin Board&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/catalog/&quot;&gt;Catalog&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://web.byui.edu/directory/student/schedule/&quot;&gt;Class Schedule&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/ce/&quot;&gt;Continuing Education and Community Connections&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/devotionals/default.htm&quot;&gt;Devotionals and Speeches&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/employment/&quot;&gt;Employment Opportunities&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/FinancialAid/&quot;&gt;Financial Aid and Scholarships&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/foodservices/&quot;&gt;Food Services&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/sle/default.htm&quot;&gt;Giving to BYU-Idaho&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/housing/&quot;&gt;Housing&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/ilearn/&quot;&gt;I-Learn&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.lib.byui.edu/&quot;&gt;Library&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/online/&quot;&gt;Online Learning&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/registrarsoffice/&quot;&gt;Registration&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://activities.byui.edu/&quot;&gt;Student Services and Activities&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/webcameras/&quot;&gt;Web Cams, Road and Weather Report&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;div class=&quot;span-6 link_list&quot;&gt;&lt;h4&gt;Registration&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/StudentHonor/Continuing%20Endorsement.htm &quot;&gt;Ecclesiastical Endorsements&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/registrarsoffice/RegSchedule.htm&quot;&gt;Registration dates&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;https://secure.byui.edu/cas/login?service=https://web.byui.edu/Services/Login/?RedirectURL=https://my.byui.edu&quot;&gt;Registering online&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/catalog/2011-2012/default.htm&quot;&gt;Course Offerings&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/admissions/students/current/meddeferment.shtml&quot;&gt;Deferment&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Help Tools&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;a href=&quot;http://www.besmart.com/&quot;&gt;Accept Admissions&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/CareerServices/&quot;&gt;Career Advising&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;https://byui-csm.symplicity.com/&quot;&gt;Career Navigator&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/Disabilities/&quot;&gt;Disability Services Center&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/international/&quot;&gt;International Student Services&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/maps/&quot;&gt;Maps&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/eventservices/&quot;&gt;Room Scheduling&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/stc/&quot;&gt;Student Technology Center&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/helpdesk/&quot;&gt;Technology Help Desk&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;div class=&quot;span-6 link_list&quot;&gt;&lt;h4&gt;Academic Tools&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/graduation/apply.htm&quot;&gt;Apply for graduation&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://web.byui.edu/directory/student/schedule/&quot;&gt;Class schedule&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;https://my.byui.edu/ICS/Academics/Degree_Information.jnz&quot;&gt;Degree Audit&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://my.byui.edu/ics/&quot;&gt;Email&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/FinancialAid/&quot;&gt;Financial Help&amp;Tools&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/financialaid/fa/loans.htm&quot;&gt;Loans/Grants&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/financialaid/scholarships/apply.htm&quot;&gt;Scholarships&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;https://my.byui.edu/ICS/Academics/&quot;&gt;Grade Report&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/ilearn/&quot;&gt;iLearn&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://web.byui.edu/PhysicalFacilities/LockerRentals/LockerRental.aspx&quot;&gt;Locker Rentals&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.lib.byui.edu/&quot;&gt;McKay Library&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://my.byui.edu/&quot;&gt;MY.BYUI.EDU&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/online/&quot;&gt;Online Learning&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://testing.byui.edu/&quot;&gt;Testing Center&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byuistore.com/c-21-textbooks.aspx&quot;&gt;Textbooks&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/academic-support-centers/study-skills-tutoring-center/&quot;&gt;Tutoring Center&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;div class=&quot;span-6 link_list last&quot;&gt;&lt;h4&gt;Student Life&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;a href=&quot;http://activities.byui.edu/&quot;&gt;Activities&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byuistore.com/&quot;&gt;Bookstore&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/bulletinboard/&quot;&gt;Classified Ads&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/visitcampus/&quot;&gt;Campus Tours&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://web.byui.edu/BulletinBoard2/Rides.aspx&quot;&gt;Carpools&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/deanofstudents/&quot;&gt;Conflict Mediation&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/counselingcenter/&quot;&gt;Counseling Center&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/devotionals/default.htm&quot;&gt;Devotionals&amp;Forums&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/eventservices/&quot;&gt;Event Services&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/foodservices/&quot;&gt;Food Services&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://beta.byui.edu/health-center/&quot;&gt;Health Center&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/StudentHonor/&quot;&gt;Honor Code&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/housing/&quot;&gt;Housing&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/Bursar/I-CardPolicies.htm&quot;&gt;I-Card services&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/foodservices/onlinepurchasing/diningdollars/diningdollars.htm&quot;&gt;Meal plans&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/ParkingServices/&quot;&gt;Parking Services&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/security/&quot;&gt;Safety and Security&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byuicomm.net/&quot;&gt;Scroll/I-Comm&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/StudentEmployment/&quot;&gt;Student Employment&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&lt;a href=&quot;http://www.byui.edu/tickets/&quot;&gt;Ticket Office&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/nav&gt;&lt;/div&gt;

			&lt;div id=&quot;bottom_padding&quot; class=&quot;margin_bleed&quot;&gt;&lt;/div&gt;
			&lt;div id=&quot;footer_brand&quot; class=&quot;margin_bleed&quot;&gt;
				&lt;div id=&quot;left_container&quot; class=&quot;span-16&quot;&gt;
					&lt;p&gt;Brigham Young University-Idaho is a part of the LDS Church Education System Institutions of Higher Learning:&lt;/p&gt;
					&lt;div&gt;
						&lt;a id=&quot;lds_church_link&quot; href=&quot;http://www.lds.org&quot; target=&quot;_blank&quot; title=&quot;The Church of Jesus Christ of Latter-Day Saints&quot;&gt;The Church of Jesus Christ of Latter-Day Saints&lt;/a&gt;
						&lt;a id=&quot;byu_link&quot; href=&quot;http://www.byu.edu&quot; target=&quot;_blank&quot; title=&quot;Brigham Young University - Provo&quot;&gt;Brigham Young University - Provo&lt;/a&gt;
						&lt;a id=&quot;byuh_link&quot; href=&quot;http://www.byuh.edu&quot; target=&quot;_blank&quot; title=&quot;Brigham young University - Hawai'i&quot;&gt;Brigham young University - Hawai'i&lt;/a&gt;
						&lt;a id=&quot;ldsbc_link&quot; href=&quot;http://www.ldsbc.edu&quot; target=&quot;_blank&quot; title=&quot;LDS Business College&quot;&gt;LDS Business College&lt;/a&gt;
					&lt;/div&gt;
				&lt;/div&gt;
				&lt;div id=&quot;right_container&quot; class=&quot;span-8 last&quot;&gt;
					&lt;div id=&quot;social_icons&quot;&gt;
						&lt;a id=&quot;byui_facebook_link&quot; href=&quot;http://www.byui.edu/social-media/facebook/&quot; target=&quot;_blank&quot; title=&quot;BYU-I Facebook&quot;&gt;BYU-I Facebook&lt;/a&gt;
						&lt;a id=&quot;byui_youtube_link&quot; href=&quot;http://www.byui.edu/social-media/youtube/&quot; target=&quot;_blank&quot; title=&quot;BYU-I YouTube&quot;&gt;BYU-I YouTube&lt;/a&gt;
						&lt;a id=&quot;byui_linkedIn_link&quot; href=&quot;http://www.byui.edu/social-media/linkedin/&quot; target=&quot;_blank&quot; title=&quot;BYU-I LinkedIn&quot;&gt;BYU-I LinkedIn&lt;/a&gt;
					&lt;/div&gt;
					&lt;p&gt;&#169;2012 Brigham Young University&#8211;Idaho&lt;br/&gt;525 South Center St., Rexburg, ID 83460, (208) 496-1411&lt;/p&gt;
					&lt;nav id=&quot;access_links&quot;&gt;
						&lt;ul&gt;
							&lt;li class=&quot;first&quot;&gt;&lt;a href=&quot;http://www.byui.edu/disabilities/&quot;&gt;Disability Services&lt;/a&gt;&lt;/li&gt;
							&lt;li&gt;&lt;a href=&quot;&quot;&gt;Text Home Page&lt;/a&gt;&lt;/li&gt;
							&lt;li class=&quot;last&quot;&gt;&lt;a href=&quot;http://m.byui.edu/&quot; title=&quot;Mobile Tools&quot;&gt;Mobile Tools&lt;/a&gt;&lt;/li&gt;
						&lt;/ul&gt;
					&lt;/nav&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		&lt;/footer&gt;
    &lt;/div&gt;
    &lt;!-- END CONTAINER DIV --&gt;
    &lt;script src=&quot;https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js&quot;&gt;&lt;/script&gt;
	&lt;script&gt;window.jQuery || document.write('&lt;script src=&quot;http://www.byui.edu/search/googlemini2/js/libs/jquery-1.6.2.min.js&quot;&gt;&lt;\/script&gt;')&lt;/script&gt;
	&lt;!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
    chromium.org/developers/how-tos/chrome-frame-getting-started --&gt;
    &lt;!--[if lt IE 7 ]&gt;
      &lt;script src=&quot;//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js&quot;&gt;&lt;/script&gt;
      &lt;script&gt;window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})&lt;/script&gt;
    &lt;![endif]--&gt;
    &lt;script src=&quot;http://www.byui.edu/search/googlemini2/js/mylibs/leftNav_contactExpander.js&quot;&gt;&lt;/script&gt;
    &lt;!-- Used for facebook feed component --&gt;
&lt;/body&gt;
&lt;/html&gt;

 <!-- BYU-I footer END -->   
    
</xsl:text>
 <!-- </span>-->
</xsl:template>

<xsl:template name="my_page_endHTML">
    <xsl:text disable-output-escaping="yes">
    	&lt;/html&gt;
    </xsl:text>
</xsl:template>


<!-- **********************************************************************
 Logo template (can be customized)
     ********************************************************************** -->
<xsl:template name="logo">
    <a href="http://www.byui.edu"><img src="{$logo_url}"
      width="{$logo_width}" height="{$logo_height}"
      alt="Go to BYU-Idaho Home PAge" border="0" /></a>
</xsl:template>


<!-- **********************************************************************
 Search result page header (can be customized): logo and search box
     ********************************************************************** -->
<xsl:template name="result_page_header">
    <table id="top_search_area" border="0" cellpadding="0" cellspacing="0">
      <xsl:if test="$show_logo != '0'">
        <tr>
          <td rowspan="3" valign="top">
            <xsl:call-template name="logo"/>
            <xsl:call-template name="nbsp3"/>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="$show_top_search_box != '0'">
        <tr>
          <td valign="middle">
            <xsl:call-template name="search_box">
              <xsl:with-param name="type" select="'std_top'"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="/GSP/CT">
                <tr>
          <td valign="top">
            <br/>
            <xsl:call-template name="stopwords"/>
            <br/>
          </td>
        </tr>
      </xsl:if>
    </table>
</xsl:template>


<!-- **********************************************************************
 Search within results page header (can be customized): logo and search box
     ********************************************************************** -->
<xsl:template name="swr_page_header">
    <table border="0" cellpadding="0" cellspacing="0">
      <xsl:if test="$show_logo != '0'">
        <tr>
          <td rowspan="3" valign="top">
            <xsl:call-template name="logo"/>
            <xsl:call-template name="nbsp3"/>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="$show_top_search_box != '0'">
        <tr>
          <td valign="middle">
            <xsl:call-template name="search_box">
              <xsl:with-param name="type" select="'swr'"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:if>
    </table>
</xsl:template>


<!-- **********************************************************************
 Home search page header (can be customized): logo and search box
     ********************************************************************** -->
<xsl:template name="home_page_header">
    <table border="0" cellpadding="0" cellspacing="0">
      <xsl:if test="$show_logo != '0'">
        <tr>
          <td rowspan="3" valign="top">
            <xsl:call-template name="logo"/>
            <xsl:call-template name="nbsp3"/>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="$show_top_search_box != '0'">
        <tr>
          <td valign="middle">
            <xsl:call-template name="search_box">
              <xsl:with-param name="type" select="'home'"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:if>
    </table>
</xsl:template>


<!-- **********************************************************************
 Separation bar variables (used in advanced search header and result page)
     ********************************************************************** -->
<xsl:variable name="sep_bar_border_color">
  <xsl:choose>
    <xsl:when test="$choose_sep_bar = 'ltblue'">#F2F2F0</xsl:when>
    <xsl:when test="$choose_sep_bar = 'blue'">#F2F2F0</xsl:when>
    <xsl:otherwise><xsl:value-of select="$global_bg_color"/></xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="sep_bar_bg_color">
  <xsl:choose>
    <xsl:when test="$choose_sep_bar = 'ltblue'">#F2F2F0</xsl:when>
    <xsl:when test="$choose_sep_bar = 'blue'">#F2F2F0</xsl:when>
    <xsl:otherwise><xsl:value-of select="$global_bg_color"/></xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="sep_bar_text_color">
  <xsl:choose>
    <xsl:when test="$choose_sep_bar = 'ltblue'">#000000</xsl:when>
    <xsl:when test="$choose_sep_bar = 'blue'">#ffffff</xsl:when>
    <xsl:otherwise><xsl:value-of select="$global_text_color"/></xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- **********************************************************************
 Advanced search page header HTML (can be customized)
     ********************************************************************** -->
<xsl:template name="advanced_search_header">
      <table border="0" cellpadding="0" cellspacing="0">

        <tr>

          <td valign="top">
            <xsl:if test="$show_logo != '0'">
                  <xsl:call-template name="logo"/>
            </xsl:if>
          </td>
        </tr>
      </table>
</xsl:template>


<!-- **********************************************************************
 Cached page header (can be customized)
     ********************************************************************** -->
<xsl:template name="cached_page_header">
  <xsl:param name="cached_page_url"/>
  <xsl:variable name="stripped_url" select="substring-after($cached_page_url,
                                                            '://')"/>
<!--<table border="1" width="100%">
  <tr>
    <td>
      <table border="1" width="100%" cellpadding="10" cellspacing="0"
        bgcolor="{$global_bg_color}" color="{$global_bg_color}">
        <tr>
          <td>-->
<!--<div>-->
            <font face="{$global_font}" color="{$global_text_color}" size="-1">
             <xsl:value-of select="$cached_page_header_text"/>
             <xsl:call-template name="nbsp"/>
             <xsl:choose>
              <xsl:when test="starts-with($cached_page_url,
                                          $db_url_protocol)">
               <a href="{concat('/db/',$stripped_url)}">
               <font color="{$global_link_color}">
               <xsl:value-of select="$cached_page_url"/></font></a>.<xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
              </xsl:when>
              <xsl:when test="starts-with($cached_page_url,
                                          $nfs_url_protocol)">
               <a href="{concat('/nfs/',$stripped_url)}">
               <font color="{$global_link_color}">
               <xsl:value-of select="$cached_page_url"/></font></a>.<xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
              </xsl:when>
              <xsl:when test="starts-with($cached_page_url,
                                          $smb_url_protocol)">
               <a href="{concat('/smb/',$stripped_url)}">
               <font color="{$global_link_color}">
               <xsl:value-of select="$cached_page_url"/></font></a>.<xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
              </xsl:when>
              <xsl:otherwise>
               <a href="{$cached_page_url}"><font color="{$global_link_color}">
               <xsl:value-of select="$cached_page_url"/></font></a>.<xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
              </xsl:otherwise>
             </xsl:choose>
            </font>
          <!--</td>
        </tr>
      </table>
    </td>
  </tr>
</table>-->
<!--</div>-->
<hr/>
</xsl:template>


<!-- **********************************************************************
 "Search Within Results" search input page (can be customized)
     ********************************************************************** -->
<xsl:template name="swr_search">
<xsl:text disable-output-escaping="yes">
	&lt;html&gt;>
</xsl:text>
  <xsl:call-template name="langHeadStart"/>
    <xsl:text disable-output-escaping="yes">&lt;title&gt;</xsl:text><xsl:value-of select="$swr_page_title"/><xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>
  <xsl:call-template name="style"/>
  <xsl:call-template name="langHeadEnd"/>
  <xsl:text disable-output-escaping="yes">
  	&lt;body dir="ltr"&gt;
  </xsl:text>

  <xsl:call-template name="analytics"/>
  <xsl:call-template name="my_page_header"/>
  <xsl:call-template name="swr_page_header"/>
  <xsl:text disable-output-escaping="yes">
  &lt;hr/&gt;
  </xsl:text>
  <xsl:call-template name="copyright"/>
  <xsl:call-template name="my_page_footer"/>
<xsl:text disable-output-escaping="yes">
  &lt;/body&gt;
&lt;/html&gt;
</xsl:text>
</xsl:template>


<!-- **********************************************************************
 "Front door" search input page (can be customized)
     ********************************************************************** -->
<xsl:template name="front_door">
<xsl:text disable-output-escaping="yes">
	&lt;html&gt;>
</xsl:text>
  <xsl:call-template name="langHeadStart"/>
     <xsl:text disable-output-escaping="yes">&lt;title&gt;</xsl:text>><xsl:value-of select="$front_page_title"/><xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>
  <xsl:call-template name="style"/>
  <xsl:call-template name="langHeadEnd"/>

  <xsl:text disable-output-escaping="yes">
  	&lt;body dir="ltr"&gt;
  </xsl:text>
  <xsl:call-template name="analytics"/>
  <xsl:call-template name="my_page_header"/>
  <xsl:call-template name="home_page_header"/>
  <hr/>
  <xsl:call-template name="copyright"/>
  <xsl:call-template name="my_page_footer"/>
  <xsl:text disable-output-escaping="yes">
  &lt;/body&gt;
&lt;/html&gt;
</xsl:text>>
</xsl:template>


<!-- **********************************************************************
 Empty result set (can be customized)
     ********************************************************************** -->
<xsl:template name="no_RES">
  <xsl:param name="query"/>

  <!-- *** Output Google Desktop results (if enabled and any available) *** -->
  <xsl:if test="$egds_show_desktop_results != '0'">
    <xsl:call-template name="desktop_results"/>
  </xsl:if>

  <!--<span class="p">-->
  <xsl:text disable-output-escaping="yes">
  &lt;br /&gt;
  Your search - &lt;strong&gt;</xsl:text><xsl:value-of select="$query"/><xsl:text disable-output-escaping="yes">&lt;/strong&gt; - did not match any documents.
  &lt;br /&gt;
  No pages were found containing &lt;strong&gt;</xsl:text>"<xsl:value-of select="$query"/>"<xsl:text disable-output-escaping="yes">&lt;/strong&gt;.
  &lt;br /&gt;
  &lt;br /&gt;
  Suggestions:
  &lt;ul&gt;
    &lt;li&gt;Make sure all words are spelled correctly.&lt;/li&gt;
    &lt;li&gt;Try different keywords.&lt;/li&gt;</xsl:text>
    <xsl:if test="/GSP/PARAM[(@name='access') and(@value='a')]">
    <xsl:text disable-output-escaping="yes">
      &lt;li&gt;Make sure your security credentials are correct.&lt;/li&gt;
    </xsl:text>
    </xsl:if>
  <xsl:text disable-output-escaping="yes">
    &lt;li&gt;Try more general keywords.&lt;/li&gt;
  &lt;/ul&gt;
  </xsl:text>
  <!--</span>-->

</xsl:template>


<!-- ######################################################################
 We do not recommend changes to the following code.  Google Technical
 Support Personnel currently do not support customization of XSLT under
 these Technical Support Services Guidelines.  Such services may be
 provided on a consulting basis, at Google's then-current consulting
 services rates under a separate agreement, if Google personnel are
 available.  Please ask your Google Account Manager for more details if
 you are interested in purchasing consulting services.
     ###################################################################### -->


<!-- **********************************************************************
 Global Style (do not customize)
        default font type/size/color, background color, link color
         using HTML CSS (Cascading Style Sheets)
     ********************************************************************** -->
<xsl:template name="style">
<style type="text/css">
<xsl:comment>
blockquote{margin:0}                                                                                       <!-- BYU-I CSS (this line) -->
body,td,div,.p,a,.d,.s{font-family:<xsl:value-of select="$global_font"/>}
body,td,div,.p,a,.d{font-size: <xsl:value-of select="$global_font_size"/>}
body,div,td,.p,.s{color:<xsl:value-of select="$global_text_color"/>}
body,.d,.p,.s{background-color:<xsl:value-of select="$global_bg_color"/>}
body{}        <!-- BYU-I CSS (this line) -->
.s{font-size: <xsl:value-of select="$res_snippet_size"/>}
.g{margin-top: 0; margin-bottom: 0; border-bottom:1px solid #333333; padding:5px 20px 20px 20px; line-height:18px;}
.s td{width:34em; line-height:18px;}
.l{font-size: <xsl:value-of select="$res_title_size"/>}
.l{color: <xsl:value-of select="$res_title_color"/>}
.l{text-decoration:none;}
a, a:hover, a:active, a:visited{text-decoration:none;}
a:link,.w,.w a:link{color:<xsl:value-of select="$global_link_color"/>}
a:link,.w,.w a:link{text-decoration:none;}
.f,.f:link,.f a:link{color:<xsl:value-of select="$faint_color"/>}
.f{font-size: 12px;}
a:visited,.f a:visited{color:<xsl:value-of select="$global_vlink_color"/>}
a:active,.f a:active{color:<xsl:value-of select="$global_alink_color"/>}
.t{color:<xsl:value-of select="$sep_bar_text_color"/>}
.t{background-color:<xsl:value-of select="$sep_bar_bg_color"/>}
.z{display:none}
.i,.i:link{color:#3A6FA9}
.a,.a:link{color:<xsl:value-of select="$res_url_color"/>}
div.n {margin-top: 2ex}
.n a{font-size: 10pt; color:<xsl:value-of select="$global_text_color"/>}
.n .i{font-size: 12pt; font-weight:bold; position: relative; top: 1px}
.q a:visited,.q a:link,.q a:active,.q {color:#333333;}
.b,.b a{font-size: 12pt; color:#333333; font-weight:bold}
.d{margin-right:1em; margin-left:1em;}
div.oneboxResults {max-height:150px;overflow:hidden;}



</xsl:comment>
</style>
</xsl:template>

<!-- **********************************************************************
 URL variables (do not customize)
     ********************************************************************** -->
<!-- *** if this is a test search (help variable)-->
<xsl:variable name="is_test_search"
  select="/GSP/PARAM[@name='testSearch']/@value"/>

<!-- *** if this is a search within results search *** -->
<xsl:variable name="swrnum">
  <xsl:choose>
    <xsl:when test="/GSP/PARAM[(@name='swrnum') and (@value!='')]">
      <xsl:value-of select="/GSP/PARAM[@name='swrnum']/@value"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="0"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- *** help_url: search tip URL (html file) *** -->
<xsl:variable name="help_url">/user_help.html</xsl:variable>

<!-- *** alerts_url: Alerts URL (html file) *** -->
<xsl:variable name="alerts_url">/alerts</xsl:variable>

<!-- *** base_url: collection info *** -->
<xsl:variable name="base_url">
  <xsl:for-each
    select="/GSP/PARAM[@name = 'client' or

                     @name = 'site' or
                     @name = 'num' or
                     @name = 'output' or
                     @name = 'proxystylesheet' or
                     @name = 'access' or
                     @name = 'lr' or
                     @name = 'ie']">
    <xsl:value-of select="@name"/>=<xsl:value-of select="@original_value"/>
    <xsl:if test="position() != last()">&amp;</xsl:if>
  </xsl:for-each>
</xsl:variable>

<!-- *** home_url: search? + collection info + &proxycustom=<HOME/> *** -->
<xsl:variable name="home_url">search?<xsl:value-of select="$base_url"
  />&amp;proxycustom=&lt;HOME/&gt;</xsl:variable>


<!-- *** synonym_url: does not include q, as_q, and start elements *** -->
<xsl:variable name="synonym_url"><xsl:for-each
  select="/GSP/PARAM[(@name != 'q') and
                     (@name != 'as_q') and
                     (@name != 'swrnum') and

		     (@name != 'ie') and
                     (@name != 'start') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
    <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
    <xsl:value-of select="@original_value"/>
    <xsl:if test="position() != last()">
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:variable>

<!-- *** search_url *** -->
<xsl:variable name="search_url">
  <xsl:for-each select="/GSP/PARAM[(@name != 'start') and
                                   (@name != 'swrnum') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
    <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
    <xsl:value-of select="@original_value"/>
    <xsl:if test="position() != last()">
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:variable>

<!-- *** filter_url: everything except resetting "filter=" *** -->
<xsl:variable name="filter_url">search?<xsl:for-each
  select="/GSP/PARAM[(@name != 'filter') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
    <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
    <xsl:value-of select="@original_value"/>
    <xsl:if test="position() != last()">
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    </xsl:if>
  </xsl:for-each>
  <xsl:text disable-output-escaping='yes'>&amp;filter=</xsl:text>
</xsl:variable>

<!-- *** adv_search_url: search? + $search_url + as_q=$q *** -->
<xsl:variable name="adv_search_url">search?<xsl:value-of
  select="$search_url"/>&amp;proxycustom=&lt;ADVANCED/&gt;</xsl:variable>

<!-- *** db_url_protocol: googledb:// *** -->
<xsl:variable name="db_url_protocol">googledb://</xsl:variable>

<!-- *** nfs_url_protocol: nfs:// *** -->
<xsl:variable name="nfs_url_protocol">nfs://</xsl:variable>

<!-- *** smb_url_protocol: smb:// *** -->
<xsl:variable name="smb_url_protocol">smb://</xsl:variable>

<!-- *** unc_url_protocol: unc:// *** -->
<xsl:variable name="unc_url_protocol">unc://</xsl:variable>

<!-- *** swr_search_url: search? + $search_url + as_q=$q *** -->
<xsl:variable name="swr_search_url">search?<xsl:value-of
  select="$search_url"/>&amp;swrnum=<xsl:value-of select="/GSP/RES/M"/></xsl:variable>

<!-- *** analytics_script_url: http://www.google-analytics.com/urchin.js *** -->
<xsl:variable
 name="analytics_script_url">http://www.google-analytics.com/urchin.js</xsl:variable>

<!-- **********************************************************************
 Search Parameters (do not customize)
     ********************************************************************** -->

<!-- *** num_results: actual num_results per page *** -->
<xsl:variable name="num_results">
  <xsl:choose>
    <xsl:when test="/GSP/PARAM[(@name='num') and (@value!='')]">
      <xsl:value-of select="/GSP/PARAM[@name='num']/@value"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="10"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- *** form_params: parameters carried by the search input form *** -->
<xsl:template name="form_params">
  <xsl:for-each
    select="PARAM[@name != 'q' and
                  @name != 'ie' and
                  not(contains(@name, 'as_')) and
                  @name != 'btnG' and
                  @name != 'btnI' and
                  @name != 'site' and
                  @name != 'filter' and
                  @name != 'swrnum' and
                  @name != 'start' and
                  @name != 'access' and
                  @name != 'ip' and
                  (@name != 'epoch' or $is_test_search != '') and
                  not(starts-with(@name ,'metabased_'))]">
        <input type="hidden" name="{@name}" value="{@value}" />

      <xsl:if test="@name = 'oe'">
        <input type="hidden" name="ie" value="{@value}" />
      </xsl:if>
    <xsl:text>
    </xsl:text>
  </xsl:for-each>
  <xsl:if test="$search_collections_xslt = '' and PARAM[@name='site']">
    <input type="hidden" name="site" value="{PARAM[@name='site']/@value}"/>
  </xsl:if>
</xsl:template>

<!-- *** space_normalized_query: q = /GSP/Q *** -->
<xsl:variable name="qval">
  <xsl:value-of select="/GSP/Q"/>
</xsl:variable>

<xsl:variable name="space_normalized_query">
  <xsl:value-of select="normalize-space($qval)"
    disable-output-escaping="yes"/>
</xsl:variable>

<!-- *** stripped_search_query: q, as_q, ... for cache highlight *** -->
<xsl:variable name="stripped_search_query"><xsl:for-each
  select="/GSP/PARAM[(@name = 'q') or
                     (@name = 'as_q') or
                     (@name = 'as_oq') or
                     (@name = 'as_epq')]"><xsl:value-of select="@original_value"
  /><xsl:if test="position() != last()"
    ><xsl:text disable-output-escaping="yes">+</xsl:text
     ></xsl:if></xsl:for-each>
</xsl:variable>

<xsl:variable name="access">
  <xsl:choose>
    <xsl:when test="/GSP/PARAM[(@name='access') and ((@value='s') or (@value='a'))]">
      <xsl:value-of select="/GSP/PARAM[@name='access']/@original_value"/>
    </xsl:when>
    <xsl:otherwise>p</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- **********************************************************************
 Figure out what kind of page this is (do not customize)
     ********************************************************************** -->
<xsl:template match="GSP">
  <xsl:choose>
    <xsl:when test="Q">
      <xsl:choose>
        <xsl:when test="$swrnum != 0">
          <xsl:call-template name="swr_search"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="search_results"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="CACHE">
      <xsl:call-template name="cached_page"/>
    </xsl:when>
    <xsl:when test="CUSTOM/HOME">
      <xsl:call-template name="front_door"/>
    </xsl:when>
    <xsl:when test="CUSTOM/ADVANCED">
      <xsl:call-template name="advanced_search"/>
    </xsl:when>
    <xsl:when test="ERROR">
      <xsl:call-template name="error_page">
        <xsl:with-param name="errorMessage" select="$server_error_msg_text"/>
        <xsl:with-param name="errorDescription" select="$server_error_des_text"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="error_page">
        <xsl:with-param name="errorMessage" select="$xml_error_msg_text"/>
        <xsl:with-param name="errorDescription" select="$xml_error_des_text"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- **********************************************************************
 Cached page (do not customize)
     ********************************************************************** -->
<xsl:template name="cached_page">
<xsl:variable name="cached_page_url" select="CACHE/CACHE_URL"/>
<xsl:variable name="cached_page_html" select="CACHE/CACHE_HTML"/>

<!-- *** decide whether to load html page or pdf file *** -->
<xsl:if test="'.pdf' != substring($cached_page_url,
              1 + string-length($cached_page_url) - string-length('.pdf')) and
              not(starts-with($cached_page_url, $db_url_protocol)) and
              not(starts-with($cached_page_url, $nfs_url_protocol)) and
              not(starts-with($cached_page_url, $smb_url_protocol)) and
              not(starts-with($cached_page_url, $unc_url_protocol))">
    <base href="{$cached_page_url}"/>
</xsl:if>

<!-- *** display cache page header *** -->
<xsl:call-template name="cached_page_header">
  <xsl:with-param name="cached_page_url" select="$cached_page_url"/>
</xsl:call-template>

<!-- *** display cached contents *** -->
<xsl:value-of select="$cached_page_html" disable-output-escaping="yes"/>
</xsl:template>

<xsl:template name="escape_quot">
  <xsl:param name="string"/>
  <xsl:call-template name="replace_string">
    <xsl:with-param name="find" select="'&quot;'"/>
    <xsl:with-param name="replace" select="'&amp;quot;'"/>
    <xsl:with-param name="string" select="$string"/>
  </xsl:call-template>
</xsl:template>

<!-- **********************************************************************
 Advanced search page (do not customize)
     ********************************************************************** -->
<xsl:template name="advanced_search">

<xsl:variable name="html_escaped_as_q">
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string" select="/GSP/PARAM[@name='q']/@value"/>
    </xsl:call-template>
    <xsl:value-of select="' '"/>
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string" select="/GSP/PARAM[@name='as_q']/@value"/>
    </xsl:call-template>
</xsl:variable>

<xsl:variable name="html_escaped_as_epq">
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string" select="/GSP/PARAM[@name='as_epq']/@value"/>
    </xsl:call-template>
</xsl:variable>

<xsl:variable name="html_escaped_as_oq">
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string" select="/GSP/PARAM[@name='as_oq']/@value"/>
    </xsl:call-template>
</xsl:variable>

<xsl:variable name="html_escaped_as_eq">
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string" select="/GSP/PARAM[@name='as_eq']/@value"/>
    </xsl:call-template>
</xsl:variable>

<!-- <html>  tag inside langHeadStart-->
<xsl:call-template name="langHeadStart"/>
<title><xsl:value-of select="$adv_page_title"/></title>
<xsl:call-template name="style"/>

<!-- script type="text/javascript" -->
<script>
<xsl:comment>
function setFocus() {
document.f.as_q.focus(); }
function esc(x){
x = escape(x).replace(/\+/g, "%2b");
if (x.substring(0,2)=="\%u") x="";
return x;
}
function collecturl(target, custom) {
var p = new Array();var i = 0;var url="";var z = document.f;
if (z.as_q.value.length) {p[i++] = 'as_q=' + esc(z.as_q.value);}
if (z.as_epq.value.length) {p[i++] = 'as_epq=' + esc(z.as_epq.value);}
if (z.as_oq.value.length) {p[i++] = 'as_oq=' + esc(z.as_oq.value);}
if (z.as_eq.value.length) {p[i++] = 'as_eq=' + esc(z.as_eq.value);}
if (z.as_sitesearch.value.length)
  {p[i++]='as_sitesearch='+esc(z.as_sitesearch.value);}
if (z.as_lq.value.length) {p[i++] = 'as_lq=' + esc(z.as_lq.value);}
if (z.as_occt.options[z.as_occt.selectedIndex].value.length)
  {p[i++]='as_occt='+esc(z.as_occt.options[z.as_occt.selectedIndex].value);}
if (z.as_dt.options[z.as_dt.selectedIndex].value.length)
  {p[i++]='as_dt='+esc(z.as_dt.options[z.as_dt.selectedIndex].value);}
if (z.lr.options[z.lr.selectedIndex].value != '') {p[i++] = 'lr=' +
  z.lr.options[z.lr.selectedIndex].value;}
if (z.num.options[z.num.selectedIndex].value != '10')
  {p[i++] = 'num=' + z.num.options[z.num.selectedIndex].value;}
if (z.sort.options[z.sort.selectedIndex].value != '')
  {p[i++] = 'sort=' + z.sort.options[z.sort.selectedIndex].value;}
if (typeof(z.client) != 'undefined')
  {p[i++] = 'client=' + esc(z.client.value);}
if (typeof(z.site) != 'undefined')
  {p[i++] = 'site=' + esc(z.site.value);}
if (typeof(z.output) != 'undefined')
  {p[i++] = 'output=' + esc(z.output.value);}
if (typeof(z.proxystylesheet) != 'undefined')
  {p[i++] = 'proxystylesheet=' + esc(z.proxystylesheet.value);}
if (typeof(z.ie) != 'undefined')
  {p[i++] = 'ie=' + esc(z.ie.value);}
if (typeof(z.oe) != 'undefined')
  {p[i++] = 'oe=' + esc(z.oe.value);}

if (typeof(z.access) != 'undefined')
  {p[i++] = 'access=' + esc(z.access.value);}
if (custom != '')
  {p[i++] = 'proxycustom=' + '&lt;ADVANCED/&gt;';}
if (p.length &gt; 0) {
url = p[0];
for (var j = 1; j &lt; p.length; j++) { url += "&amp;" + p[j]; }}
 location.href = target + '?' + url;
}
// </xsl:comment>
</script>

    <xsl:call-template name="langHeadEnd"/>

    <xsl:text disable-output-escaping="yes">
    &lt;body onload="setFocus()" dir="ltr"&gt;
    </xsl:text>

    <!-- Analytics script first to initialize it. -->
    <xsl:call-template name="analytics"/>

    <!-- *** Customer's own advanced search page header *** -->
    <xsl:if test="$choose_adv_search_page_header = 'mine' or
                    $choose_adv_search_page_header = 'both'">
      <!-- <xsl:call-template name="my_page_header"/> -->
      <xsl:call-template name="my_page_body" />
    </xsl:if>

    <!--====Advanced Search Header======-->
    <xsl:if test="$choose_adv_search_page_header = 'provided' or
                    $choose_adv_search_page_header = 'both'">
      <xsl:call-template name="advanced_search_header"/>
    </xsl:if>

    <xsl:call-template name="top_sep_bar">
      <xsl:with-param name="text" select="$sep_bar_adv_text"/>
      <xsl:with-param name="show_info" select="0"/>
      <xsl:with-param name="time" select="0"/>
    </xsl:call-template>

    <!--====Carry over Search Parameters======-->
    <form method="get" action="search" name="f">
      <xsl:if test="PARAM[@name='client']">
        <input type="hidden" name="client"
          value="{PARAM[@name='client']/@value}" />
      </xsl:if>
    <!--==== site is carried over in the drop down if the menu is used =====-->
      <xsl:if test="$search_collections_xslt = '' and PARAM[@name='site']">
        <input type="hidden" name="site" value="{PARAM[@name='site']/@value}"/>
      </xsl:if>
      <xsl:if test="PARAM[@name='output']">
        <input type="hidden" name="output"
          value="{PARAM[@name='output']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='proxystylesheet']">
        <input type="hidden" name="proxystylesheet"
          value="{PARAM[@name='proxystylesheet']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='ie']">
        <input type="hidden" name="ie"
          value="{PARAM[@name='ie']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='oe']">
        <input type="hidden" name="oe"
          value="{PARAM[@name='oe']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='hl']">
        <input type="hidden" name="hl"
          value="{PARAM[@name='hl']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='getfields']">
        <input type="hidden" name="getfields"
          value="{PARAM[@name='getfields']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='requiredfields']">
        <input type="hidden" name="requiredfields"
          value="{PARAM[@name='requiredfields']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='partialfields']">
        <input type="hidden" name="partialfields"
          value="{PARAM[@name='partialfields']/@value}" />
      </xsl:if>

      <!--====Advanced Search Options======-->

      <table id ="adv_search_box" cellspacing="0" cellpadding="3" border="0" width="100%">
        <tr bgcolor="{$adv_search_panel_bgcolor}">
          <td>
            <table width="100%" cellspacing="0" cellpadding="0" border="0">
              <tr bgcolor="{$adv_search_panel_bgcolor}">
                <td>
                  <table id="find_resutls_area" width="100%" cellspacing="0" cellpadding="2"
                  border="0">
                    <tr>
                      <td class="left_text" valign="top" width="15%"><font size="-1"><br />
                      <strong>Find results</strong></font> </td>

                      <td width="85%">
                        <table width="100%" cellpadding="2"
                        border="0" cellspacing="0">
                          <tr>
                            <td><font size="-1">with <strong>all</strong> of the words</font></td>

                            <td>
                            <xsl:text disable-output-escaping="yes">
                             &lt;input class=&quot;vert_text&quot; type=&quot;text&quot;
                             name=&quot;as_q&quot;
                             size=&quot;25&quot; value=&quot;</xsl:text>
                            <xsl:value-of disable-output-escaping="yes"
                             select="$html_escaped_as_q"/>
                            <xsl:text disable-output-escaping="yes">&quot;&gt;</xsl:text>

                            <script type="text/javascript">
                              <xsl:comment>
                                document.f.as_q.focus();
                              // </xsl:comment>
                            </script>
                            </td>

                            <td valign="top" rowspan="4">
                            <font size="-1">
                            <select class="vert_text" name="num">
                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='num') and (@value!='10')]">
                                  <option value="10">10 results</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="10" selected="selected">10 results</option>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='num') and (@value='20')]">
                                  <option value="20" selected="selected">20 results</option>
                                </xsl:when>
                                  <xsl:otherwise>
                                    <option value="20">20 results</option>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='num') and (@value='30')]">
                                  <option value="30" selected="selected">30 results</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="30">30 results</option>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='num') and (@value='50')]">
                                  <option value="50" selected="selected">50 results</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="50">50 results</option>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='num') and (@value='100')]">
                                  <option value="100" selected="selected">100 results</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="100">100 results</option>
                                </xsl:otherwise>
                              </xsl:choose>
                            </select>
                            </font>
                            </td>
                            <xsl:call-template name="collection_menu"/>
                            <td>
                            <font size="-1">
                            <input type="submit" name="btnG"
                              value="{$search_button_text}" />
                            </font>
                            </td>
                          </tr>

                          <tr>
                            <td nowrap="nowrap"><font size="-1">with the <strong>exact phrase</strong></font></td>

                            <td>
                            <xsl:text disable-output-escaping="yes">

                             &lt;input class=&quot;vert_text&quot; type=&quot;text&quot;
                             name=&quot;as_epq&quot;
                             size=&quot;25&quot; value=&quot;</xsl:text>
                            <xsl:value-of disable-output-escaping="yes"
                             select="$html_escaped_as_epq"/>
                            <xsl:text disable-output-escaping="yes">&quot;&gt;</xsl:text>
                            </td>
                          </tr>

                          <tr>
                            <td nowrap="nowrap"><font size="-1">with <strong>at least one</strong> of the words</font></td>

                            <td>
                            <xsl:text disable-output-escaping="yes">

                             &lt;input class=&quot;vert_text&quot; type=&quot;text&quot;
                             name=&quot;as_oq&quot;
                             size=&quot;25&quot; value=&quot;</xsl:text>
                            <xsl:value-of disable-output-escaping="yes"
                             select="$html_escaped_as_oq"/>
                            <xsl:text disable-output-escaping="yes">&quot;&gt;</xsl:text>
                            </td>
                          </tr>

                          <tr>
                            <td nowrap="nowrap"><font size="-1"><strong>without</strong> the words</font></td>

                            <td>
                            <xsl:text disable-output-escaping="yes">

                             &lt;input class=&quot;vert_text&quot; type=&quot;text&quot;
                             name=&quot;as_eq&quot;
                             size=&quot;25&quot; value=&quot;</xsl:text>
                            <xsl:value-of disable-output-escaping="yes"
                             select="$html_escaped_as_eq"/>
                            <xsl:text disable-output-escaping="yes">&quot;&gt;</xsl:text>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr bgcolor="{$global_bg_color}">
                <td>
                  <table width="100%" cellspacing="0"
                  cellpadding="2" border="0">
                    <tr>
                      <td class="left_text" width="15%"><font size="-1"><strong>Language</strong></font></td>

                      <td width="40%"><font size="-1">Return pages written in</font></td>

                      <td style="padding: 5px 2px 2px 2px"><font size="-1">



                         <xsl:choose>
                        <xsl:when test="PARAM[(@name='oe') and (@value!='')]">
                          <xsl:text disable-output-escaping="yes">&lt;select class=&quot;vert_text&quot; name=&quot;lr&quot;&gt;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text disable-output-escaping="yes">&lt;select class=&quot;vert_text&quot; name=&quot;lr&quot; onchange=&quot;javascript:collecturl('search', 'adv');&quot;&gt;</xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>

                        <option value="">any language</option>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_ar')]">
                            <option value="lang_ar"
                              selected="selected">Arabic</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_ar">Arabic</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_zh-CN')]">
                            <option value="lang_zh-CN"
                              selected="selected">Chinese (Simplified)</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_zh-CN">Chinese (Simplified)</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_zh-TW')]">
                            <option value="lang_zh-TW"
                              selected="selected">Chinese (Traditional)</option>
                          </xsl:when>
                          <xsl:otherwise>
                              <option value="lang_zh-TW">Chinese (Traditional)</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_cs')]">
                            <option value="lang_cs" selected="selected">Czech</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_cs">Czech</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_da')]">
                            <option value="lang_da" selected="selected">Danish</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_da">Danish</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_nl')]">
                            <option value="lang_nl" selected="selected">Dutch</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_nl">Dutch</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_en')]">
                            <option value="lang_en" selected="selected">English</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_en">English</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_et')]">
                            <option value="lang_et" selected="selected">Estonian</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_et">Estonian</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_fi')]">
                            <option value="lang_fi" selected="selected">Finnish</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_fi">Finnish</option>
                          </xsl:otherwise>
                        </xsl:choose>

                         <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_fr')]">
                            <option value="lang_fr" selected="selected">French</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_fr">French</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_de')]">
                            <option value="lang_de" selected="selected">German</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_de">German</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_el')]">
                            <option value="lang_el" selected="selected">Greek</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_el">Greek</option>
                          </xsl:otherwise>
                        </xsl:choose>

                         <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_iw')]">
                            <option value="lang_iw" selected="selected">Hebrew</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_iw">Hebrew</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_hu')]">
                            <option value="lang_hu" selected="selected">Hungarian</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_hu">Hungarian</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_is')]">
                            <option value="lang_is" selected="selected">Icelandic</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_is">Icelandic</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_it')]">
                            <option value="lang_it" selected="selected">Italian</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_it">Italian</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_ja')]">
                            <option value="lang_ja" selected="selected">Japanese</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_ja">Japanese</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_ko')]">
                            <option value="lang_ko" selected="selected">Korean</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_ko">Korean</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_lv')]">
                            <option value="lang_lv" selected="selected">Latvian</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_lv">Latvian</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_lt')]">
                            <option value="lang_lt" selected="selected">Lithuanian</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_lt">Lithuanian</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_no')]">
                            <option value="lang_no" selected="selected">Norwegian</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_no">Norwegian</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_pl')]">
                            <option value="lang_pl" selected="selected">Polish</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_pl">Polish</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_pt')]">
                            <option value="lang_pt" selected="selected">Portuguese</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_pt">Portuguese</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_ro')]">
                            <option value="lang_ro" selected="selected">Romanian</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_ro">Romanian</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_ru')]">
                            <option value="lang_ru" selected="selected">Russian</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_ru">Russian</option>
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_es')]">
                            <option value="lang_es" selected="selected">Spanish</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_es">Spanish</option>
                          </xsl:otherwise>
                        </xsl:choose>

                         <xsl:choose>
                          <xsl:when test="PARAM[(@name='lr') and (@value='lang_sv')]">
                            <option value="lang_sv" selected="selected">Swedish</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="lang_sv">Swedish</option>
                          </xsl:otherwise>
                        </xsl:choose>
                      <xsl:text disable-output-escaping="yes">&lt;/select&gt;</xsl:text>
                      </font></td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr bgcolor="{$global_bg_color}">
                <td>
                  <table width="100%" cellpadding="2"
                  cellspacing="0" border="0">
                    <tr>
                      <td class="left_text" width="15%"><font size="-1"><strong>File Format</strong></font></td>

                      <td width="40%" nowrap="nowrap"><font size="-1"><select name="as_ft">
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_ft') and (@value='i')]">
                            <option value="i" selected="selected">Only</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="i">Only</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_ft') and (@value='e')]">
                            <option value="e" selected="selected">Don't</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="e">Don't</option>
                          </xsl:otherwise>
                        </xsl:choose>
                      </select><span class="left_text"> return </span> results of the file format</font>
                      </td>

                      <td><font size="-1">
                      <select class="vert_text" name="as_filetype">
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_filetype') and (@value!='')]">
                            <option value="">any format</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="" selected="selected">any format</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_filetype') and (@value='pdf')]">
                            <option value="pdf" selected="selected">Adobe Acrobat PDF (.pdf)</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="pdf">Adobe Acrobat PDF (.pdf)</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_filetype') and (@value='ps')]">
                            <option value="ps" selected="selected">Adobe Postscript (.ps)</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="ps">Adobe Postscript (.ps)</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_filetype') and (@value='doc')]">
                            <option value="doc" selected="selected">Microsoft Word (.doc)</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="doc">Microsoft Word (.doc)</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_filetype') and (@value='xls')]">
                            <option value="xls" selected="selected">Microsoft Excel (.xls)</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="xls">Microsoft Excel (.xls)</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_filetype') and (@value='ppt')]">
                            <option value="ppt" selected="selected">Microsoft Powerpoint (.ppt)</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="ppt">Microsoft Powerpoint (.ppt)</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_filetype') and (@value='rtf')]">
                            <option value="rtf" selected="selected">Rich Text Format (.rtf)</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="rtf">Rich Text Format (.rtf)</option>
                          </xsl:otherwise>
                        </xsl:choose>
                      </select>
                      </font></td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr bgcolor="{$global_bg_color}">
                <td>
                  <table width="100%" cellspacing="0"
                  cellpadding="2" border="0">
                    <tr>
                      <td class="left_text" width="15%"><font size="-1"><strong>Occurrences</strong></font></td>

                      <td nowrap="nowrap" width="40%"><font size="-1">Return results where my terms occur</font></td>

                      <td><font size="-1"><select class="vert_text"
                      name="as_occt">
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_occt') and (@value!='any')]">
                            <option value="any"> anywhere in the page </option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="any" selected="selected">
                              anywhere in the page
                            </option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_occt') and (@value='title')]">
                            <option value="title" selected="selected">in the title of the page</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="title">in the title of the page</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_occt') and (@value='url')]">
                            <option value="url" selected="selected">in the URL of the page</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="url">in the URL of the page</option>
                          </xsl:otherwise>
                        </xsl:choose>
                      </select></font></td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr bgcolor="{$global_bg_color}">
                <td>
                  <table width="100%" cellpadding="2"
                  cellspacing="0" border="0">
                    <tr>
                      <td class="left_text" width="15%"><font size="-1"><strong>Domain</strong></font></td>

                      <td width="40%" nowrap="nowrap"><font size="-1"><select
                      name="as_dt">
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_dt') and (@value='i')]">
                            <option value="i" selected="selected">Only</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="i">Only</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='as_dt') and (@value='e')]">
                            <option value="e" selected="selected">Don't</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="e">Don't</option>
                          </xsl:otherwise>
                        </xsl:choose>
                      </select><span class="left_text" > return </span>results from the site or domain</font></td>

                      <td>
                        <table cellpadding="0" cellspacing="0"
                        border="0">
                          <tr>
                            <td>
                              <xsl:choose>
                                <xsl:when test="PARAM[@name='as_sitesearch']">
                                  <input class="vert_text" type="text" size="25"
                                  value="{PARAM[@name='as_sitesearch']/@value}"
                                  name="as_sitesearch" />
                                </xsl:when>
                                <xsl:otherwise>
                                  <input class="vert_text" type="text" size="25" value="" name="as_sitesearch" />
                                </xsl:otherwise>
                              </xsl:choose>
                            </td>
                          </tr>

                          <tr>
                            <td valign="top" nowrap="nowrap"><font size="-1">
                              <i>e.g. byui.edu, .org</i></font></td>
                          </tr>
                        </table>
                      </td>
                    </tr>

                    <!-- Sort by Date feature -->
                    <tr>
                      <td class="left_text" width="15%"><font size="-1"><strong>Sort</strong></font></td>

                      <td style="padding: 2px 2px 5px 2px" colspan="2" nowrap="nowrap"><font size="-1"><select class="vert_text"
                      name="sort">
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='sort') and (@value='')]">
                            <option value="" selected="selected">Sort by relevance</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="">Sort by relevance</option>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="PARAM[(@name='sort') and (@value='date:D:S:d1')]">
                            <option value="date:D:S:d1" selected="selected">Sort by date</option>
                          </xsl:when>
                          <xsl:otherwise>
                            <option value="date:D:S:d1">Sort by date</option>
                          </xsl:otherwise>
                        </xsl:choose>
                      </select></font></td>
                    </tr>
                    <!-- Secure Search feature -->
                    <xsl:if test="$show_secure_radio != '0'">

                    <tr>
                      <td width="15%"><font size="-1"><strong>Security</strong></font></td>

                      <td colspan="2" nowrap="nowrap"><font size="-1">
                        <xsl:choose>
                          <xsl:when test="$access='p'">
                            <label><input type="radio" name="access" value="p" checked="checked" />Search public content only</label>
                          </xsl:when>
                        <xsl:otherwise>
                          <label><input type="radio" name="access" value="p"/>Search public content only</label>
                        </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="$access='a'">
                            <label><input type="radio" name="access" value="a" checked="checked" />Search public and secure content (login required)</label>
                          </xsl:when>
                        <xsl:otherwise>
                          <label><input type="radio" name="access" value="a"/>Search public and secure content (login required)</label>
                        </xsl:otherwise>
                        </xsl:choose>
                      </font></td>
                    </tr>
                    </xsl:if>
                  </table>
                </td>
              </tr>

            </table>
          </td>
        </tr>
      </table>
      <br />
      <br />

      <!--====Page-Specific Search======-->
      <table cellpadding="6" cellspacing="0" border="0">
        <tr>
          <td><strong>Page-Specific Search</strong></td>
        </tr>
      </table>

      <table cellspacing="0" cellpadding="3" border="0" width="100%">
        <tr bgcolor="{$adv_search_panel_bgcolor}">
          <td>
            <table width="100%" cellpadding="0" cellspacing="0"
            border="0">
              <tr bgcolor="{$adv_search_panel_bgcolor}">
                <td>

                  <table width="100%" cellpadding="2"
                  cellspacing="0" border="0">
                  <form method="get" action="search" name="h">

                    <tr bgcolor="{$global_bg_color}">
                      <td class="left_text" width="15%"><font size="-1"><strong>Links</strong></font></td>

                      <td width="40%" nowrap="nowrap"><font size="-1">Find pages that link to the page</font> </td>

                      <td nowrap="nowrap">
                          <xsl:choose>
                            <xsl:when test="PARAM[@name='as_lq']">
                              <input class="vert_text" type="text" size="30"
                               value="{PARAM[@name='as_lq']/@value}"
                                       name="as_lq" />
                          </xsl:when>
                          <xsl:otherwise>
                            <input class="vert_text" type="text" size="30" value="" name="as_lq" />
                          </xsl:otherwise>
                        </xsl:choose>
                        <font size="-1">
                        <input style="margin-left: 5px" type="submit" name="btnG" value="{$search_button_text}" /></font>
                      </td>
                    </tr>
                  </form>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <xsl:call-template name="copyright"/>

    </form>

    <!-- *** Customer's own advanced search page footer *** -->
    <xsl:call-template name="my_page_footer"/>

    <!-- *** HTML footer *** -->
    <xsl:text disable-output-escaping="yes">
    &lt;/body&gt;
    </xsl:text>

    <xsl:call-template name="my_page_endHTML"/>

</xsl:template>

<!-- **********************************************************************
 Resend query with filter=p to disable path_filtering
 if there is only one result cluster (do not customize)
     ********************************************************************** -->
<xsl:template name="redirect_if_few_results">
  <xsl:variable name="count" select="count(/GSP/RES/R)"/>
  <xsl:variable name="start" select="/GSP/RES/@SN"/>
  <xsl:variable name="filterall"
    select="count(/GSP/PARAM[@name='filter']) = 0"/>
  <xsl:variable name="filter" select="/GSP/PARAM[@name='filter']/@value"/>

</xsl:template>

<!-- **********************************************************************
 Search results (do not customize)
     ********************************************************************** -->
<xsl:template name="search_results">


  <!-- *** HTML header and style *** -->
  <xsl:call-template name="langHeadStart"/>
  <!--<xsl:call-template name="my_page_header"/>-->
    <xsl:call-template name="redirect_if_few_results"/>
    <title><xsl:value-of select="$result_page_title"/>:
      <xsl:value-of select="$space_normalized_query"/>
    </title>
    <xsl:call-template name="style"/>
    <script type="text/javascript">
      <xsl:comment>
        function resetForms() {
          for (var i = 0; i &lt; document.forms.length; i++ ) {
              document.forms[i].reset();
          }
        }
      //</xsl:comment>
    </script>
  <xsl:call-template name="langHeadEnd"/>
  <xsl:text disable-output-escaping="yes">
  &lt;body onload="resetForms()" dir="ltr"&gt;
  </xsl:text>

  <!-- *** Analytics script first to initialize it. *** -->
  <xsl:call-template name="analytics"/>

  <!-- *** Customer's own result page header *** -->
  <xsl:if test="$choose_result_page_header = 'mine' or
                $choose_result_page_header = 'both'">
    <xsl:call-template name="my_page_body"/>
  </xsl:if>

  <!-- *** Result page header *** -->
  <xsl:if test="$choose_result_page_header = 'provided' or
                $choose_result_page_header = 'both'">
    <xsl:call-template name="result_page_header" />
  </xsl:if>

  <!-- *** Top separation bar *** -->
    <xsl:if test="Q != ''">
      <xsl:call-template name="top_sep_bar">
        <xsl:with-param name="text" select="$sep_bar_std_text"/>
          <xsl:with-param name="show_info" select="$show_search_info"/>
        <xsl:with-param name="time" select="TM"/>
      </xsl:call-template>
    </xsl:if>

    <!-- *** Handle results (if any) *** -->
    <xsl:choose>
      <xsl:when test="RES or GM or Spelling or Synonyms or CT or /GSP/ENTOBRESULTS">
        <xsl:call-template name="results">
          <xsl:with-param name="query" select="Q"/>
          <xsl:with-param name="time" select="TM"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="Q=''">
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="no_RES">
          <xsl:with-param name="query" select="Q"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>

    <!-- *** Google footer *** -->
    <xsl:call-template name="copyright"/>

    <!-- *** Customer's own result page footer *** -->
    <xsl:call-template name="my_page_footer"/>

  <!-- *** HTML footer *** -->
  <xsl:text disable-output-escaping="yes">
  &lt;/body&gt;
  </xsl:text>
 <xsl:call-template name="my_page_endHTML"/>

</xsl:template>


<!-- **********************************************************************
  Collection menu beside the search box
     ********************************************************************** -->
<xsl:template name="collection_menu">
  <xsl:if test="$search_collections_xslt != ''">
    <!--<td valign="middle">-->
    <div align="center">
        
<select name="site">
 <xsl:choose>
  <xsl:when test="PARAM[(@name='site') and (@value='default_collection')]">
   <option value="default_collection" selected="selected">default_collection</option>
  </xsl:when>
  <xsl:otherwise>
   <option value="default_collection">default_collection</option>
  </xsl:otherwise>
 </xsl:choose>
 <xsl:choose>
  <xsl:when test="PARAM[(@name='site') and (@value='cms_collection')]">
   <option value="cms_collection" selected="selected">cms_collection</option>
  </xsl:when>
  <xsl:otherwise>
   <option value="cms_collection">cms_collection</option>
  </xsl:otherwise>
 </xsl:choose>
</select>

    <!--</td>-->
    </div>
  </xsl:if>
</xsl:template>

<!-- **********************************************************************
  Search box input form (Types: std_top, std_bottom, home, swr)
     ********************************************************************** -->
<xsl:template name="search_box">
  <xsl:param name="type"/>

  <form name="gs" method="get" action="search">
        <table border="0" cellpadding="0" cellspacing="0">
          <xsl:if test="($egds_show_search_tabs != '0') and (($type = 'home') or ($type = 'std_top'))">
          <tr><td>
<!--
                <table cellpadding="4" cellspacing="0">
                  <tr><td>
                        <xsl:call-template name="desktop_tab"/>
                  </td></tr>
                </table>
-->
          </td></tr>
          </xsl:if>
          <xsl:if test="($type = 'swr')">
          <tr><td>
                <table cellpadding="4" cellspacing="0">
                  <tr><td>
                    There were about <strong><xsl:value-of select="RES/M"/></strong> results for <strong><xsl:value-of select="$space_normalized_query"/></strong>.
                      <br/>
                    Use the search box below to search within these results.
                  </td></tr>
                </table>
          </td></tr>
          </xsl:if>
          <tr><td>
          <table cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle">
          <font size="-1">
            <xsl:choose>
              <xsl:when test="($type = 'swr')">
                <input type="text" name="as_q" size="{$search_box_size}" maxlength="256" value=""/>
                <input type="hidden" name="q" value="{$qval}"/>
              </xsl:when>
              <xsl:otherwise>
                <input type="text" name="q" size="{$search_box_size}" maxlength="256" value="{$space_normalized_query}"/>
                          </xsl:otherwise>
                        </xsl:choose>
          </font>
          </td>
          <xsl:call-template name="collection_menu"/>
          <td valign="middle">
          <font size="-1">
            <xsl:call-template name="nbsp"/>
              <xsl:choose>
              <xsl:when test="$choose_search_button = 'image'">
                        <input type="image" name="btnG" src="{$search_button_image_url}"
                       valign="bottom" width="60" height="26"
                       border="0" value="{$search_button_text}"/>
              </xsl:when>
              <xsl:otherwise>
                <input type="submit" name="btnG" value="{$search_button_text}"/>
              </xsl:otherwise>
              </xsl:choose>
          </font>
          </td>
                  <td nowrap="1" id="advanced_search_box">
                        <font size="-2">
                        <xsl:if test="(/GSP/RES/M > 0) and ($show_swr_link != '0') and ($type = 'std_bottom')">
                                <xsl:call-template name="nbsp"/>
                                <xsl:call-template name="nbsp"/>
                                <a href="{$swr_search_url}">
                                        <xsl:value-of select="$swr_search_anchor_text"/>
                                </a>
                                <xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$show_result_page_adv_link != '0'">
                                <xsl:call-template name="nbsp"/>
                                <xsl:call-template name="nbsp"/>
                                <a href="{$adv_search_url}">
                                        <xsl:value-of select="$adv_search_anchor_text"/>
                                </a>
                                <xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$show_alerts_link != '0'">
                                <xsl:call-template name="nbsp"/>
                                <xsl:call-template name="nbsp"/>
                                <a href="{$alerts_url}">
                                        <xsl:value-of select="$alerts_anchor_text"/>
                                </a>
                                <xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$show_result_page_help_link != '0'">
                                <xsl:call-template name="nbsp"/>
                                <xsl:call-template name="nbsp"/>
                                <a href="{$help_url}">
                                        <xsl:value-of select="$search_help_anchor_text"/>
                                </a>
                        </xsl:if>
                        <xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
                        </font>
                  </td>
        </tr>
        <xsl:if test="$show_secure_radio != '0'">
        <tr>
          <td colspan="2">
          <font size="-1">Search:
            <xsl:choose>
              <xsl:when test="$access='p'">
                <label><input type="radio" name="access" value="p" checked="checked" />public content</label>
              </xsl:when>
              <xsl:otherwise>
                <label><input type="radio" name="access" value="p"/>public content</label>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="$access='a'">
                <label><input type="radio" name="access" value="a" checked="checked" />public and secure content</label>
              </xsl:when>
              <xsl:otherwise>
                <label><input type="radio" name="access" value="a"/>public and secure content</label>
              </xsl:otherwise>
            </xsl:choose>
          </font>
          </td>
        </tr>
        </xsl:if>
      </table>
  </td></tr>
</table>
    <xsl:text>
    </xsl:text>
    <xsl:call-template name="form_params"/>
  </form>
</xsl:template>


<!-- **********************************************************************
  Bottom search box (do not customized)
     ********************************************************************** -->
<xsl:template name="bottom_search_box">
    <br clear="all"/>
    <xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
    <!-- <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="{$sep_bar_border_color}"><img width="1" height="1" alt=""/></td>
      </tr>
    </table> -->
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="{$sep_bar_bg_color}">
      <tr>
        <td id="bottom_search_bar" nowrap="1" bgcolor="{$sep_bar_bg_color}" align="center">
        <br/>
        <xsl:call-template name="search_box">
            <xsl:with-param name="type" select="'std_bottom'"/>
          </xsl:call-template>
        <br/>
        </td>
      </tr>
    </table>
    <!-- <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="{$sep_bar_border_color}"><img width="1" height="1" alt=""/></td>
      </tr>
    </table> -->
</xsl:template>


<!-- **********************************************************************
 Sort-by criteria: sort by date/relevance
     ********************************************************************** -->
<xsl:template name="sort_by">
  <xsl:variable name="sort_by_url"><xsl:for-each
    select="/GSP/PARAM[(@name != 'sort') and
                       (@name != 'start') and
                       (@name != 'epoch' or $is_test_search != '') and
                       not(starts-with(@name, 'metabased_'))]">
      <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
      <xsl:value-of select="@original_value"/>
      <xsl:if test="position() != last()">
        <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="sort_by_relevance_url">
    <xsl:value-of select="$sort_by_url"
      />&amp;sort=date%3AD%3AL%3Ad1</xsl:variable>

  <xsl:variable name="sort_by_date_url">
    <xsl:value-of select="$sort_by_url"
      />&amp;sort=date%3AD%3AS%3Ad1</xsl:variable>

  <!--<table><tr valign='top'><td>-->
  <div class="floatLeft">
  <!--<span class="s">-->
  <xsl:choose>
    <xsl:when test="/GSP/PARAM[@name = 'sort' and starts-with(@value,'date:D:S')]">
      <font color="{$global_text_color}">
      <xsl:text>Sort by date / </xsl:text>
      </font>
      <a href="search?{$sort_by_relevance_url}">Sort by relevance</a>
    </xsl:when>
    <xsl:when test="/GSP/PARAM[@name = 'sort' and starts-with(@value,'date:A:S')]">
      <font color="{$global_text_color}">
      <xsl:text>Sort by date / </xsl:text>
      </font>
      <a href="search?{$sort_by_relevance_url}">Sort by relevance</a>
    </xsl:when>
    <xsl:otherwise>
      <a href="search?{$sort_by_date_url}">Sort by date</a>
      <font color="{$global_text_color}">
      <xsl:text> / Sort by relevance</xsl:text>
      </font>
    </xsl:otherwise>
  </xsl:choose>
  <!--</span>-->
  <!--</td></tr></table>-->
  </div>
</xsl:template>

<!-- **********************************************************************
 Output all results
     ********************************************************************** -->
<xsl:template name="results">
  <xsl:param name="query"/>
  <xsl:param name="time"/>

  <!-- *** Add top navigation/sort-by bar *** -->
  <xsl:if test="($show_top_navigation != '0') or ($show_sort_by != '0')">
    <xsl:if test="RES"> <!-- there might be onebox results but no RES  -->
    <!--The following table is modified to a div by Massoud Abedian 4/1/2008-->
      <!--<table width="100%">
      <tr>-->
      <xsl:text disable-output-escaping="yes">
      &lt;div id="sorting_pagination" class="result" align="left"&gt;
      </xsl:text>
      <xsl:if test="$show_top_navigation != '0'"><xsl:text disable-output-escaping="yes"></xsl:text><!--<br /> added to create a same feel that table has-->
      <!--The following <td> is being repalaced by <p>-->
      <!--<td align="left">-->
        <xsl:call-template name="google_navigation">
	        <xsl:with-param name="prev" select="RES/NB/PU"/>
	        <xsl:with-param name="next" select="RES/NB/NU"/>
	        <xsl:with-param name="view_begin" select="RES/@SN"/>
	        <xsl:with-param name="view_end" select="RES/@EN"/>
	        <xsl:with-param name="guess" select="RES/M"/>
	        <xsl:with-param name="navigation_style" select="'top'"/>
        </xsl:call-template>
      <!--</td>-->
      </xsl:if>
      <xsl:if test="$show_sort_by != '0'">
      <!--<td align="right">-->
      <xsl:text disable-output-escaping="yes">
      <!-- &lt;p align="right"&gt; -->
      </xsl:text>
      <xsl:call-template name="sort_by"/>
      <!--</td>-->
      <xsl:text disable-output-escaping="yes">
      &lt;/p&gt;
      </xsl:text>
      </xsl:if>
     <!-- </tr>
    </table>-->
    <xsl:text disable-output-escaping="yes">
    &lt;/div&gt;
    </xsl:text>
    </xsl:if>
  </xsl:if>

  <!-- *** Handle OneBox results, if any ***-->
  <xsl:if test="$show_onebox != '0'">
    <xsl:if test="/GSP/ENTOBRESULTS">
      <xsl:call-template name="onebox"/>
    </xsl:if>
  </xsl:if>

  <!-- *** Handle spelling suggestions, if any *** -->
    <xsl:if test="$show_spelling != '0'">
      <xsl:call-template name="spelling"/>
    </xsl:if>

  <!-- *** Handle synonyms, if any *** -->
    <xsl:if test="$show_synonyms != '0'">
      <xsl:call-template name="synonyms"/>
    </xsl:if>

  <!-- *** Output Google Desktop results (if enabled and any available) *** -->
        <xsl:if test="$egds_show_desktop_results != '0'">
            <xsl:call-template name="desktop_results"/>
        </xsl:if>

  <!-- *** Output results details *** -->
  <xsl:text disable-output-escaping="yes">
    &lt;div&gt;
    </xsl:text>
    <!-- for keymatch results -->
    <xsl:if test="$show_keymatch != '0'">
      <xsl:apply-templates select="/GSP/GM"/>
    </xsl:if>

    <!-- for real results -->
    <xsl:apply-templates select="RES/R">
      <xsl:with-param name="query" select="$query"/>
    </xsl:apply-templates>

  <!-- *** Filter note (if needed) *** -->
    <xsl:if test="(RES/FI) and (not(RES/NB/NU))">
    <xsl:text disable-output-escaping="yes">
      &lt;p&gt;
        &lt;i&gt;
    </xsl:text>
        In order to show you the most relevant results,    we have omitted some entries very similar to the <xsl:value-of select="RES/@EN"/> already    displayed.<xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>If you like, you can <a style="text-decoration:underline" href="{$filter_url}0">    repeat the search with the omitted results included</a>.
        <xsl:text disable-output-escaping="yes">
        &lt;/i&gt;
      &lt;/p&gt;
      </xsl:text>
    </xsl:if>
    <xsl:text disable-output-escaping="yes">
    &lt;/div&gt;
    </xsl:text>

  <!-- *** Add bottom navigation *** -->
    <xsl:variable name="nav_style">
      <xsl:choose>
        <xsl:when test="($access='s') or ($access='a')">simple</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$choose_bottom_navigation"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="google_navigation">
      <xsl:with-param name="prev" select="RES/NB/PU"/>
      <xsl:with-param name="next" select="RES/NB/NU"/>
      <xsl:with-param name="view_begin" select="RES/@SN"/>
      <xsl:with-param name="view_end" select="RES/@EN"/>
      <xsl:with-param name="guess" select="RES/M"/>
      <xsl:with-param name="navigation_style" select="$nav_style"/>
    </xsl:call-template>

  <!-- *** Bottom search box *** -->
    <xsl:if test="$show_bottom_search_box != '0'">
      <xsl:call-template name="bottom_search_box"/>
    </xsl:if>

</xsl:template>


<!-- **********************************************************************
 Stopwords suggestions in result page (do not customize)
     ********************************************************************** -->
<xsl:template name="stopwords">
  <xsl:variable name="stopwords_suggestions1">
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select="'/help/basics.html#stopwords'"/>
      <xsl:with-param name="replace" select="'user_help.html#stop'"/>
      <xsl:with-param name="string" select="/GSP/CT"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="stopwords_suggestions">
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select="'/help/basics.html'"/>
      <xsl:with-param name="replace" select="'user_help.html'"/>
      <xsl:with-param name="string" select="$stopwords_suggestions1"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:if test="/GSP/CT">
    <font size="-1" color="gray">
      <xsl:value-of disable-output-escaping="yes"
        select="$stopwords_suggestions"/>
    </font>
  </xsl:if>
</xsl:template>


<!-- **********************************************************************
 Spelling suggestions in result page (do not customize)
     ********************************************************************** -->
<xsl:template name="spelling">
  <xsl:if test="/GSP/Spelling/Suggestion">
    <p><!--<span class="p">--><font color="{$spelling_text_color}">
         <xsl:value-of select="$spelling_text"/>
         <xsl:call-template name="nbsp"/>
       </font><!--</span>-->
       <a href="search?q={/GSP/Spelling/Suggestion[1]/@qe}&amp;spell=1&amp;{$base_url}">
       <xsl:value-of disable-output-escaping="yes"
         select="/GSP/Spelling/Suggestion[1]"/>
      </a>
    </p>
  </xsl:if>
</xsl:template>


<!-- **********************************************************************
 Synonym suggestions in result page (do not customize)
     ********************************************************************** -->
<xsl:template name="synonyms">
  <xsl:if test="/GSP/Synonyms/OneSynonym">
    <p><!--<span class="p">--><font color="{$synonyms_text_color}">
         <xsl:value-of select="$synonyms_text"/>
         <xsl:call-template name="nbsp"/>
       </font><!--</span>-->
    <xsl:for-each select="/GSP/Synonyms/OneSynonym">
      <a href="search?q={@q}&amp;{$synonym_url}">
        <xsl:value-of disable-output-escaping="yes" select="."/>
      </a><xsl:text> </xsl:text>
    </xsl:for-each>
    </p>
  </xsl:if>
</xsl:template>


<!-- **********************************************************************
 Truncation functions (do not customize)
     ********************************************************************** -->
<xsl:template name="truncate_url">
  <xsl:param name="t_url"/>

  <xsl:choose>
    <xsl:when test="string-length($t_url) &lt; $truncate_result_url_length">
      <xsl:value-of select="$t_url"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="first" select="substring-before($t_url, '/')"/>
      <xsl:variable name="last">
              <xsl:call-template name="truncate_find_last_token">
                <xsl:with-param name="t_url" select="$t_url"/>
              </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="path_limit" select="$truncate_result_url_length - (string-length($first) + string-length($last) + 1)"/>

      <xsl:choose>
              <xsl:when test="$path_limit &lt;= 0">
                <xsl:value-of select="concat(substring($t_url, 1, $truncate_result_url_length), '...')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="chopped_path">
                  <xsl:call-template name="truncate_chop_path">
                    <xsl:with-param name="path" select="substring($t_url, string-length($first) + 2, string-length($t_url) - (string-length($first) + string-length($last) + 1))"/>
                    <xsl:with-param name="path_limit" select="$path_limit"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="concat($first, '/.../', $chopped_path, $last)"/>
              </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template name="truncate_find_last_token">
  <xsl:param name="t_url"/>

  <xsl:choose>
    <xsl:when test="contains($t_url, '/')">
      <xsl:call-template name="truncate_find_last_token">
            <xsl:with-param name="t_url" select="substring-after($t_url, '/')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
            <xsl:value-of select="$t_url"/>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template name="truncate_chop_path">
  <xsl:param name="path"/>
  <xsl:param name="path_limit"/>

  <xsl:choose>
    <xsl:when test="string-length($path) &lt;= $path_limit">
      <xsl:value-of select="$path"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="truncate_chop_path">
        <xsl:with-param name="path" select="substring-after($path, '/')"/>
        <xsl:with-param name="path_limit" select="$path_limit"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


<!-- **********************************************************************
  A single result (do not customize)
     ********************************************************************** -->
<xsl:template match="R">
  <xsl:param name="query"/>



  <xsl:variable name="display_url_tmp" select="substring-after(UD, '://')"/>
  <xsl:variable name="display_url">
    <xsl:choose>
      <xsl:when test="$display_url_tmp">
        <xsl:value-of select="$display_url_tmp"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring-after(U, '://')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="escaped_url" select="substring-after(UE, '://')"/>
  <xsl:variable name="protocol" select="substring-before(U, '://')"/>
  <xsl:variable name="full_url" select="UE"/>
  <xsl:variable name="crowded_url" select="HN/@U"/>
  <xsl:variable name="crowded_display_url" select="HN"/>
  <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
  <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

  <xsl:variable name="temp_url" select="substring-after(U, '://')"/>
  <xsl:variable name="url_indexed" select="not(starts-with($temp_url, 'noindex!/'))"/>
  <xsl:variable name="stripped_url">
    <xsl:choose>
      <xsl:when test="$truncate_result_urls != '0'">
                <xsl:call-template name="truncate_url">
                  <xsl:with-param name="t_url" select="$display_url"/>
                </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
            <xsl:value-of select="$display_url"/>
          </xsl:otherwise>
        </xsl:choose>
  </xsl:variable>


  <!-- *** Indent as required (only supports 2 levels) *** -->
  <xsl:if test="@L='2'">
    <xsl:text disable-output-escaping="yes">&lt;blockquote&gt;</xsl:text>
  </xsl:if>

  <!-- *** Result Header *** -->
  <xsl:text disable-output-escaping="yes">&lt;h2&gt;</xsl:text>

  <!-- *** Result Title (including PDF tag and hyperlink) *** -->
  <xsl:if test="$show_res_title != '0'">
     <xsl:text disable-output-escaping="yes">&lt;font size="-2"&gt;&lt;strong&gt;</xsl:text>
    <xsl:choose>
      <xsl:when test="@MIME='text/html' or @MIME='' or not(@MIME)"></xsl:when>
      <xsl:when test="@MIME='text/plain'">[TEXT]</xsl:when>
      <xsl:when test="@MIME='application/rtf'">[RTF]</xsl:when>
      <xsl:when test="@MIME='application/pdf'">[PDF]</xsl:when>
      <xsl:when test="@MIME='application/postscript'">[PS]</xsl:when>
      <xsl:when test="@MIME='application/vnd.ms-powerpoint'">[MS POWERPOINT]</xsl:when>
      <xsl:when test="@MIME='application/vnd.ms-excel'">[MS EXCEL]</xsl:when>
      <xsl:when test="@MIME='application/msword'">[MS WORD]</xsl:when>
      <xsl:otherwise>
        <xsl:variable name="extension">
          <xsl:call-template name="last_substring_after">
            <xsl:with-param name="string" select="substring-after(
                                                  substring-after(U,'://'),
                                                  '/')"/>
            <xsl:with-param name="separator" select="'.'"/>
            <xsl:with-param name="fallback" select="'UNKNOWN'"/>
          </xsl:call-template>
        </xsl:variable>
        [<xsl:value-of select="translate($extension,$lower,$upper)"/>]
      </xsl:otherwise>
    </xsl:choose>
     <xsl:text disable-output-escaping="yes">&lt;/strong&gt;&lt;/font&gt;</xsl:text>
    

    <xsl:if test="$url_indexed">

      <xsl:text disable-output-escaping='yes'>&lt;a href="</xsl:text>

      <xsl:choose>
        <xsl:when test="starts-with(U, $db_url_protocol)">
          <xsl:value-of disable-output-escaping='yes'
                        select="concat('db/', substring-after(U,'://'))"/>
        </xsl:when>
	<!-- *** URI for smb or NFS must be escaped because it appears in the URI query *** -->
        <xsl:when test="$protocol='nfs' or $protocol='smb'">
	  <xsl:value-of disable-output-escaping='yes'
	                select="concat($protocol,'/',
                                substring-after(U,'://'))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of disable-output-escaping='yes' select="U"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text disable-output-escaping='yes'>"&gt;</xsl:text>
    </xsl:if>
   <!-- <span class="l">-->
    <xsl:choose>
      <xsl:when test="T">
        <xsl:call-template name="reformat_keyword">
          <xsl:with-param name="orig_string" select="T"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise><xsl:value-of select="$stripped_url"/></xsl:otherwise>
    </xsl:choose>
    <!--</span>-->
    <xsl:if test="$url_indexed">
        <xsl:text disable-output-escaping='yes'>&lt;/a&gt;&lt;/h2&gt;&lt;p class="g"&gt;</xsl:text>
    </xsl:if>
  </xsl:if>


  <!-- *** Snippet Box *** -->
 <!-- Following table has been replaced by a div
 	<table cellpadding="0" cellspacing="0" border="0">
    <tr>
      <td class="s">-->
      <!--<xsl:text disable-output-escaping="yes">
          &lt;div class="s" align="left"&gt;
      </xsl:text>-->
                  <xsl:if test="$show_res_snippet != '0'">
          <xsl:call-template name="reformat_keyword">
            <xsl:with-param name="orig_string" select="S"/>
          </xsl:call-template>
        </xsl:if>

                  <!-- *** Meta tags *** -->
                  <xsl:if test="$show_meta_tags != '0'">
                    <xsl:apply-templates select="MT"/>
                  </xsl:if>

                  <!-- *** URL *** -->
            <xsl:text disable-output-escaping="yes">
            	&lt;br /&gt;
            </xsl:text>
                        
            
	<!-- Display Source <a> tag -->


     <xsl:if test="$url_indexed">

      <xsl:text disable-output-escaping='yes'>&lt;a href="</xsl:text>

      <xsl:choose>
        <xsl:when test="starts-with(U, $db_url_protocol)">
          <xsl:value-of disable-output-escaping='yes'
                        select="concat('db/', substring-after(U,'://'))"/>
        </xsl:when>
	<!-- *** URI for smb or NFS must be escaped because it appears in the URI query *** -->
        <xsl:when test="$protocol='nfs' or $protocol='smb'">
	  <xsl:value-of disable-output-escaping='yes'
	                select="concat($protocol,'/',
                                substring-after(U,'://'))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of disable-output-escaping='yes' select="U"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text disable-output-escaping='yes'>"&gt;</xsl:text>
    </xsl:if>
    <!-- Display Source <a> tag END -->
			<!-- Display Source info -->
            
            <font color="{$res_url_color}" size="{$res_url_size}">
              <xsl:choose>
          <xsl:when test="not($url_indexed)">
            <xsl:if test="($show_res_size!='0') or
                        ($show_res_date!='0') or
                        ($show_res_cache!='0')">
              <xsl:text>Not Indexed:</xsl:text>
              <xsl:value-of select="$stripped_url"/>
            </xsl:if>
                    </xsl:when>
          <xsl:otherwise>
            <xsl:if test="$show_res_url != '0'">
              <xsl:value-of select="$stripped_url"/>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
        </font>

                  <!-- *** Miscellaneous (- size - date - cache) *** -->
        <xsl:if test="$url_indexed">
          <xsl:apply-templates select="HAS/C">
                        <xsl:with-param name="stripped_url" select="$stripped_url"/>
                        <xsl:with-param name="escaped_url" select="$escaped_url"/>
                        <xsl:with-param name="query" select="$query"/>
                        <xsl:with-param name="mime" select="@MIME"/>
                        <xsl:with-param name="date" select="FS[@NAME='date']/@VALUE"/>
          </xsl:apply-templates>
        </xsl:if>

		<!-- Display Source info END -->
	<!-- Display Source </a> tag -->

    <xsl:if test="$url_indexed">
        <xsl:text disable-output-escaping='yes'>&lt;/a&gt;</xsl:text>
    </xsl:if>

	<!-- Display Source </a> tag END-->


                  <!-- *** Link to more links from this site *** -->
        <xsl:if test="HN">
          <xsl:text disable-output-escaping="yes">&lt;br /&gt;</xsl:text>
          [
          <a class="f" href="search?as_sitesearch={$crowded_url}&amp;{
            $search_url}">More results from <xsl:value-of select="$crowded_display_url"/></a>
          ]



  <!-- *** Link to aggregated results from database source *** -->
       <xsl:if test="starts-with($crowded_url, $db_url_protocol)">
        [
        <a class="f" href="dbaggr?sitesearch={$crowded_url}&amp;{
          $search_url}">View all data</a>
            ]
          </xsl:if>
        </xsl:if>


  <!-- *** Result Footer *** -->
     <!-- </td>
    </tr>
  </table>-->
  <xsl:text disable-output-escaping="yes">
      
      &lt;/p&gt;
  </xsl:text>

  <!-- *** End indenting as required (only supports 2 levels) *** -->
  <xsl:if test="@L='2'">
    <xsl:text disable-output-escaping="yes">&lt;/blockquote&gt;</xsl:text>
  </xsl:if>
	<!--<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>-->
</xsl:template>

<!-- **********************************************************************
  Meta tag values within a result (do not customize)
     ********************************************************************** -->
<xsl:template match="MT">
	<xsl:text disable-output-escaping="yes">
      &lt;br /&gt;
    </xsl:text>
  <!--<span class="f">--><xsl:value-of select="@N"/>: <!--</span>--><xsl:value-of select="@V"/>
</xsl:template>

<!-- **********************************************************************
  A single keymatch result (do not customize)
     ********************************************************************** -->

<xsl:template match="GM">
  <p>
    <table id="keymatch_info" cellpadding="10" cellspacing="0" border="0" height="40" width="100%">
      <tr>
        <td nowrap="0" bgcolor="{$keymatch_bg_color}" height="40">
          <a href="{GL}" class="keymatch_word">
            <xsl:value-of select="GD"/>
          </a>
          <br/>
          <a href="{GL}">
            <font size="-1" color="{$res_url_color}">
              <span class="a">
                 <xsl:value-of select="GL"/>
              </span>
            </font>
          </a>
        </td>
        <td bgcolor="{$keymatch_bg_color}" height="40"
          align="right" valign="top">
          <b>
          <font size="-1" color="{$keymatch_text_color}">
            <xsl:value-of select="$keymatch_text"/>
          </font>
          </b>
        </td>
      </tr>
    </table>
  </p>
</xsl:template>


<!-- **********************************************************************
  Variables for reformatting keyword-match display (do not customize)
     ********************************************************************** -->
<xsl:variable name="keyword_orig_start" select="'&lt;b&gt;'"/>
<xsl:variable name="keyword_orig_end" select="'&lt;/b&gt;'"/>

<xsl:variable name="keyword_reformat_start">
  <xsl:if test="$res_keyword_format">
    <xsl:text>&lt;</xsl:text>
    <xsl:value-of select="$res_keyword_format"/>
    <xsl:text>&gt;</xsl:text>
  </xsl:if>
  <xsl:if test="($res_keyword_size) or ($res_keyword_color)">
  <xsl:text>&lt;font</xsl:text>
  <xsl:if test="$res_keyword_size">
    <xsl:text> size="</xsl:text>
    <xsl:value-of select="$res_keyword_size"/>
    <xsl:text>"</xsl:text>
  </xsl:if>
  <xsl:if test="$res_keyword_color">
    <xsl:text> color="</xsl:text>
    <xsl:value-of select="$res_keyword_color"/>
    <xsl:text>"</xsl:text>
  </xsl:if>
  <xsl:text>&gt;</xsl:text>
  </xsl:if>
</xsl:variable>

<xsl:variable name="keyword_reformat_end">
  <xsl:if test="($res_keyword_size) or ($res_keyword_color)">
    <xsl:text>&lt;/font&gt;</xsl:text>
  </xsl:if>
  <xsl:if test="$res_keyword_format">
    <xsl:text>&lt;/</xsl:text>
    <xsl:value-of select="$res_keyword_format"/>
    <xsl:text>&gt;</xsl:text>
  </xsl:if>
</xsl:variable>

<!-- **********************************************************************
  Reformat the keyword match display in a title/snippet string
     (do not customize)
     ********************************************************************** -->
<xsl:template name="reformat_keyword">
  <xsl:param name="orig_string"/>

  <xsl:variable name="reformatted_1">
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select="$keyword_orig_start"/>
      <xsl:with-param name="replace" select="$keyword_reformat_start"/>
      <xsl:with-param name="string" select="$orig_string"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="reformatted_2">
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select="$keyword_orig_end"/>
      <xsl:with-param name="replace" select="$keyword_reformat_end"/>
      <xsl:with-param name="string" select="$reformatted_1"/>
    </xsl:call-template>
  </xsl:variable>

 <xsl:variable name="reformatted_3">
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select="'&lt;br&gt;'"/>
      <xsl:with-param name="replace" select="'&lt;br /&gt;'"/>
      <xsl:with-param name="string" select="$reformatted_2"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:value-of disable-output-escaping='yes' select="$reformatted_3"/>

</xsl:template>


<!-- **********************************************************************
  Helper templates for generating a result item (do not customize)
     ********************************************************************** -->

<!-- *** Miscellaneous: - size - date - cache *** -->
<xsl:template match="C">
    <xsl:param name="stripped_url"/>
    <xsl:param name="escaped_url"/>
    <xsl:param name="query"/>
    <xsl:param name="mime"/>
    <xsl:param name="date"/>

    <xsl:variable name="docid"><xsl:value-of select="@CID"/></xsl:variable>

    <xsl:if test="$show_res_size != '0'">
    <xsl:if test="not(@SZ='')">
        <font color="{$res_url_color}" size="{$res_url_size}">
          <xsl:text> - </xsl:text>
          <xsl:value-of select="@SZ"/>
        </font>
    </xsl:if>
    </xsl:if>

    <xsl:if test="$show_res_date != '0'">
    <xsl:if test="($date != '') and
                  (translate($date, '-', '') &gt; 19500000) and
                  (translate($date, '-', '') &lt; 21000000)">
        <font color="{$res_url_color}" size="{$res_url_size}">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="$date"/>
        </font>
    </xsl:if>
    </xsl:if>

    <xsl:if test="$show_res_cache != '0'">
        <font color="{$res_url_color}" size="{$res_url_size}">
        <xsl:text> - </xsl:text>
        </font>
        <xsl:variable name="cache_encoding">
          <xsl:choose>
            <xsl:when test="'' != @ENC"><xsl:value-of select="@ENC"/></xsl:when>
            <xsl:otherwise>utf-8</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <a class="f" href="search?q=cache:{$docid}:{$escaped_url}+{
                           $stripped_search_query}&amp;{$base_url}&amp;oe={
                           $cache_encoding}">
          <xsl:choose>
            <xsl:when test="not($mime)">Cached</xsl:when>
            <xsl:when test="$mime='text/html'">Cached</xsl:when>
            <xsl:when test="$mime='text/plain'">Cached</xsl:when>
            <xsl:otherwise>Text Version</xsl:otherwise>
          </xsl:choose>
        </a>
    </xsl:if>

</xsl:template>


<!-- **********************************************************************
 Google navigation bar in result page (do not customize)
     ********************************************************************** -->
<xsl:template name="google_navigation">
    <xsl:param name="prev"/>
    <xsl:param name="next"/>
    <xsl:param name="view_begin"/>
    <xsl:param name="view_end"/>
    <xsl:param name="guess"/>
    <xsl:param name="navigation_style"/>

  <xsl:variable name="fontclass">
    <xsl:choose>
      <xsl:when test="$navigation_style = 'top'">s</xsl:when>
      <xsl:otherwise>b</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- *** Test to see if we should even show navigation *** -->
  <xsl:if test="($prev) or ($next)">

  <!-- *** Start Google result navigation bar *** -->

    <xsl:if test="$navigation_style != 'top'">
      <xsl:text disable-output-escaping="yes">
        &lt;div class=&quot;n&quot;&gt;</xsl:text>
    </xsl:if>

    <!--Following Table has been replaced by a div
    <table border="0" cellpadding="0" width="1%" cellspacing="0">
      <tr align="center" valign="top">-->
      <xsl:text disable-output-escaping="yes">
      &lt;div id="result_pages" align="center"&gt;
      </xsl:text>
        <xsl:if test="$navigation_style != 'top'">
        <!--<td valign="bottom" nowrap="1">-->
        <xsl:text disable-output-escaping="yes">
        &lt;div class="left"&gt;
          &lt;font size="-1"&gt;
            Result Page
            <!-- &lt;br /&gt; -->
            </xsl:text><xsl:call-template name="nbsp"/>
          <xsl:text disable-output-escaping="yes">
          &lt;/font&gt;
        &lt;/div&gt;
        </xsl:text>
        </xsl:if>


  <!-- *** Show previous navigation, if available *** -->
        <xsl:choose>
          <xsl:when test="$prev">
            <!--<td nowrap="1">-->
            <xsl:text disable-output-escaping="yes">
				&lt;div class="left"&gt;
            </xsl:text>
              <!--<span class="{$fontclass}">-->
              <a href="search?{$search_url}&amp;start={$view_begin -
                      $num_results - 1}">
                <xsl:if test="$navigation_style = 'google'">
				<xsl:text disable-output-escaping="yes">
                  &lt;img src="/nav_previous.gif" width="68" height="26"
                    alt="Previous" border="0"/&gt;
                </xsl:text>
                  <!--<br/>-->
                 </xsl:if>
                <xsl:if test="$navigation_style = 'top'">
                  <xsl:text>&lt;</xsl:text>
                </xsl:if>
                <xsl:text>&#32;Previous</xsl:text>
              </a>
              <!--</span>-->
              <xsl:if test="$navigation_style != 'google'">
                  <xsl:call-template name="nbsp"/>
              </xsl:if>
            <!--</td>-->
            <xsl:text disable-output-escaping="yes">
            &lt;/div&gt;
            </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <!--<td nowrap="1">-->
            <xsl:text disable-output-escaping="yes">
            	&lt;div class="left"&gt;
            </xsl:text>
              <xsl:if test="$navigation_style = 'google'">
              <xsl:text disable-output-escaping="yes">
                &lt;img src="/nav_first.gif" width="18" height="26"
                  alt="First" border="0"/&gt;
               </xsl:text>
                <!--<br/>-->
              </xsl:if>
            <!--</td>-->
            <xsl:text disable-output-escaping="yes">
           		 &lt;/div&gt;
            </xsl:text>
          </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="($navigation_style = 'google') or
                      ($navigation_style = 'link')">
  <!-- *** Google result set navigation *** -->
        <xsl:variable name="mod_end">
          <xsl:choose>
            <xsl:when test="$next"><xsl:value-of select="$guess"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="$view_end"/></xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="result_nav">
          <xsl:with-param name="start" select="0"/>
          <xsl:with-param name="end" select="$mod_end"/>
          <xsl:with-param name="current_view" select="($view_begin)-1"/>
          <xsl:with-param name="navigation_style" select="$navigation_style"/>
        </xsl:call-template>
        </xsl:if>

  <!-- *** Show next navigation, if available *** -->
        <xsl:choose>
          <xsl:when test="$next">
            <!--<td nowrap="1">-->
            <!--<div class="floatLeft">-->
              <xsl:if test="$navigation_style != 'google'">
                  <xsl:call-template name="nbsp"/>
              </xsl:if>
              <!--<span class="{$fontclass}">-->
              <a href="search?{$search_url}&amp;start={$view_begin +
                $num_results - 1}">
                <xsl:if test="$navigation_style = 'google'">
				<xsl:text disable-output-escaping="yes">
                  &lt;img src="/nav_next.gif" width="100" height="26"

                    alt="Next" border="0"/&gt;
                 </xsl:text>
                  <!--<br/>-->
                </xsl:if>
                <xsl:text>Next&#32;</xsl:text>
                <xsl:if test="$navigation_style = 'top'">
                  <xsl:text>&gt;</xsl:text>
                </xsl:if>
              </a>
              <!--</span>-->
            <!--</td>-->
            <!--</div>-->
          </xsl:when>
          <xsl:otherwise>
            <!--<td nowrap="1">-->
            <xsl:text disable-output-escaping="yes">
             	&lt;div class="floatLeft"&gt;
            </xsl:text>
              <xsl:if test="$navigation_style != 'google'">
                <xsl:call-template name="nbsp"/>
              </xsl:if>
              <xsl:if test="$navigation_style = 'google'">
              <xsl:text disable-output-escaping="yes">
                &lt;img src="/nav_last.gif" width="46" height="26"
                  alt="Last" border="0"/&gt;
               </xsl:text>
                <!--<br/>-->
              </xsl:if>
            <!--</td>-->
            <xsl:text disable-output-escaping="yes">
            	&lt;/div&gt;
            </xsl:text>
          </xsl:otherwise>
        </xsl:choose>

  <!-- *** End Google result bar *** -->
      <!--</tr>
    </table>-->
    <xsl:text disable-output-escaping="yes">
    	&lt;/div&gt;
    </xsl:text>

    <xsl:if test="$navigation_style != 'top'">
      <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
    </xsl:if>
  </xsl:if>
</xsl:template>

<!-- **********************************************************************
 Helper templates for generating Google result navigation (do not customize)
   only shows 10 sets up or down from current view
     ********************************************************************** -->
<xsl:template name="result_nav">
  <xsl:param name="start" select="'0'"/>
  <xsl:param name="end"/>
  <xsl:param name="current_view"/>
  <xsl:param name="navigation_style"/>

  <!-- *** Choose how to show this result set *** -->
  
   <xsl:choose>
    <xsl:when test="($start)&lt;(($current_view)-(10*($num_results)))">
    </xsl:when>
    <xsl:when test="(($current_view)&gt;=($start)) and
                    (($current_view)&lt;(($start)+($num_results)))">
      <td>
        <xsl:if test="$navigation_style = 'google'">
          <img src="/nav_current.gif" width="16" height="26" alt="Current"/>
          <br/>
        </xsl:if>
        <xsl:if test="$navigation_style = 'link'">
          <xsl:call-template name="nbsp"/>
        </xsl:if>
        <span class="i"><xsl:value-of
          select="(($start)div($num_results))+1"/></span>
        <xsl:if test="$navigation_style = 'link'">
          <xsl:call-template name="nbsp"/>
        </xsl:if>
      </td>
    </xsl:when>
    <xsl:otherwise>
      <td>
        <xsl:if test="$navigation_style = 'link'">
            <xsl:call-template name="nbsp"/>
        </xsl:if>
        <a href="search?{$search_url}&amp;start={$start}">
        <xsl:if test="$navigation_style = 'google'">
          <img src="/nav_page.gif" width="16" height="26" alt="Navigation"
               border="0"/>
          <br/>
        </xsl:if>
        <xsl:value-of select="(($start)div($num_results))+1"/>
        </a>
        <xsl:if test="$navigation_style = 'link'">
           <xsl:call-template name="nbsp"/>
        </xsl:if>
      </td>
    </xsl:otherwise>
  </xsl:choose>

  <!-- *** Recursively iterate through result sets to display *** -->
  <xsl:if test="((($start)+($num_results))&lt;($end)) and
                ((($start)+($num_results))&lt;(($current_view)+
                (10*($num_results))))">
    <xsl:call-template name="result_nav">
      <xsl:with-param name="start" select="$start+$num_results"/>
      <xsl:with-param name="end" select="$end"/>
      <xsl:with-param name="current_view" select="$current_view"/>
      <xsl:with-param name="navigation_style" select="$navigation_style"/>
    </xsl:call-template>
  </xsl:if>

</xsl:template>


<!-- **********************************************************************
 Top separation bar (do not customize)
     ********************************************************************** -->
<xsl:template name="top_sep_bar">
  <xsl:param name="text"/>
  <xsl:param name="show_info"/>
  <xsl:param name="time"/>

    <!-- <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="{$sep_bar_border_color}"><img width="1" height="1" alt=""/></td>
      </tr>
    </table> -->
    <table id="result_bar" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="{$sep_bar_bg_color}">
      <tr>
        <td nowrap="1" width="1%" bgcolor="{$sep_bar_bg_color}">
           <font size="+1">
                   <xsl:call-template name="nbsp"/><b><xsl:value-of select="$text"/></b>
           </font>
         </td>
        <td nowrap="1" align="right" bgcolor="{$sep_bar_bg_color}" id="results_meta">
          <xsl:if test="$show_info != '0'">
            <font size="-1">
            <xsl:if test="count(/GSP/RES/R)>0 ">
              <xsl:choose>
                <xsl:when test="$access = 's' or $access = 'a'">
                  Results <b><xsl:value-of select="RES/@SN"/></b> - <b><xsl:value-of select="RES/@EN"/></b> for <b><xsl:value-of select="$space_normalized_query"/></b>.
                </xsl:when>
                <xsl:otherwise>
                  Results <b><xsl:value-of select="RES/@SN"/></b> - <b><xsl:value-of select="RES/@EN"/></b> of about <b><xsl:value-of select="RES/M"/></b> for <b><xsl:value-of select="$space_normalized_query"/></b>.
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
              Search took <b><xsl:value-of select="round($time * 100.0) div 100.0"/></b> seconds.
            </font>
          </xsl:if>
        </td>
      </tr>
    </table>
    <hr class="z"/>
    <xsl:if test="$choose_sep_bar = 'line'">
      <hr size="1" color="gray"/>
    </xsl:if>

</xsl:template>

<!-- **********************************************************************
 Analytics script (do not customize)
     ********************************************************************** -->
<xsl:template name="analytics">
  <xsl:if test="string-length($analytics_account) != '0'">
    <script src="{$analytics_script_url}" type="text/javascript"></script>
    <script type="text/javascript">
      <xsl:comment>
      _uacct = "<xsl:value-of select='$analytics_account'/>";
      urchinTracker();
      //</xsl:comment>
    </script>
  </xsl:if>
</xsl:template>

<!-- **********************************************************************
 Utility function for constructing copyright text (do not customize)
     ********************************************************************** -->
<xsl:template name="copyright">
<!--

	<xsl:text disable-output-escaping="yes">
      &lt;div align="center"&gt;
    	&lt;br /&gt;&lt;br /&gt;
        &lt;p&gt;
        &lt;font face="helvetica,arial,sans-serif" size="-1" color="#2f2f2f"&gt;
          Powered by Google Search Appliance&lt;/font&gt;
        &lt;/p&gt;				
  	  &lt;/div&gt;
  </xsl:text>
-->
</xsl:template>


<!-- **********************************************************************
 Utility functions for generating html entities
     ********************************************************************** -->
<xsl:template name="nbsp">
  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
</xsl:template>
<xsl:template name="nbsp3">
  <xsl:call-template name="nbsp"/>
  <xsl:call-template name="nbsp"/>
  <xsl:call-template name="nbsp"/>
</xsl:template>
<xsl:template name="nbsp4">
  <xsl:call-template name="nbsp3"/>
  <xsl:call-template name="nbsp"/>
</xsl:template>
<xsl:template name="quot">
  <xsl:text disable-output-escaping="yes">&amp;quot;</xsl:text>
</xsl:template>
<xsl:template name="copy">
  <xsl:text disable-output-escaping="yes">&amp;copy;</xsl:text>
</xsl:template>

<!-- **********************************************************************
 Utility functions for generating head elements so that the XSLT processor
 won't add a meta tag to the output, since it may specify the wrong
 encoding (utf8) in the meta tag.
     ********************************************************************** -->
<xsl:template name="plainHeadStart">
  <xsl:text disable-output-escaping="yes">&lt;head&gt;</xsl:text>
  <meta name="robots" content="NOINDEX,NOFOLLOW"/>
  <xsl:text>
  </xsl:text>
</xsl:template>
<xsl:template name="plainHeadEnd">
  <xsl:text disable-output-escaping="yes">&lt;/head&gt;</xsl:text>
  <xsl:text>
  </xsl:text>
</xsl:template>


<!-- **********************************************************************
 Utility functions for generating head elements with a meta tag to the output
 specifying the character set as requested
     ********************************************************************** -->
<xsl:template name="langHeadStart">
  <xsl:text disable-output-escaping="yes">
  &lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;
&lt;html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"&gt;
  &lt;head&gt;  
  &lt;meta name="robots" content="NOINDEX,NOFOLLOW" /&gt;
  </xsl:text>
  <xsl:choose>
    <xsl:when test="PARAM[(@name='oe') and (@value='utf8')]">
     <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=utf-8" /&gt;
      </xsl:text>
    </xsl:when>
    
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_zh-CN')]">
     <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=gb2312" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_zh-TW')]">
     <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=Big5" /&gt;
      </xsl:text>
      
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_cs')]">
       <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-2" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_da')]">
       <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_nl')]">
       <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_en')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_et')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_fi')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_fr')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_de')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_el')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-7" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_iw')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-8-I" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_hu')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-2" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_is')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_it')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_ja')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=Shift_JIS" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_ko')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=EUC-KR" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_lv')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_lt')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_no')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_pl')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-2" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_pt')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_ro')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-2" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_ru')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=windows-1251" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_es')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:when test="PARAM[(@name='lr') and (@value='lang_sv')]">
      <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=utf-8" /&gt;
      </xsl:text>
    </xsl:when>
    <xsl:otherwise>
    <xsl:text disable-output-escaping="yes">
      &lt;meta http-equiv="content-type" content="text/html; charset=utf-8" /&gt;
    </xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="langHeadEnd">
  <xsl:text disable-output-escaping="yes">
  &lt;meta name="description" content="" /&gt;
&lt;meta name="keywords" content="" /&gt;


<!--
 *
 * Template's broken auto suggestion function. Replace with our own when ready.
 *
 -->

&lt;script type="text/javascript" language="javascript"&gt;
// If you wish to turn off the suggestion feature for the search box, set suggest_in_search = false;
var suggest_in_search = true;
var xmlpath = '../keywords.xml';
&lt;/script&gt;

<!-- Template END -->

<!-- All BYU-I Changes made here will need to be implemented in the header inports located at the top of this document. -->

&lt;meta charset=&quot;utf-8&quot;&gt;

	&lt;title&gt;Brigham Young University - Idaho&lt;/title&gt;
	&lt;meta name=&quot;description&quot; content=&quot;&quot;&gt;
    &lt;meta name=&quot;author&quot; content=&quot;Brigham Young University-Idaho&quot;&gt;

	&lt;!-- Mobile viewport optimized: j.mp/bplateviewport --&gt;
    &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width,initial-scale=1&quot;&gt;
	&lt;link rel=&quot;icon&quot; href=&quot;http://www.byui.edu/search/googlemini2/favicon.ico&quot; /&gt;
    
    &lt;!-- Blueprint and Regressive/Progressive Adaptive scripts for older/cross-browser compliance --&gt;
	&lt;link rel=&quot;stylesheet&quot; href=&quot;http://www.byui.edu/search/googlemini2/css/blueprint/screen.css&quot; type=&quot;text/css&quot; media=&quot;screen, projection&quot;&gt;
	&lt;link rel=&quot;stylesheet&quot; href=&quot;http://www.byui.edu/search/googlemini2/css/blueprint/print.css&quot; type=&quot;text/css&quot; media=&quot;print&quot;&gt; 
	&lt;!--[if lt IE 9]&gt;
		&lt;link rel=&quot;stylesheet&quot; href=&quot;http://www.byui.edu/search/googlemini2/css/blueprint/ie.css&quot; type=&quot;text/css&quot; media=&quot;screen, projection&quot;&gt;
		&lt;script src=&quot;http://html5shiv.googlecode.com/svn/trunk/html5.js&quot;&gt;&lt;/script&gt;
	&lt;![endif]--&gt;

	&lt;!-- Global Stylesheet --&gt;
	&lt;link rel=&quot;stylesheet&quot; href=&quot;http://lehi3.byui.edu/search/main.css&quot; type=&quot;text/css&quot; media=&quot;screen, projection&quot;&gt;
	
&lt;/head&gt;

<!-- BYU-I javascript END -->

  &lt;/head&gt;
  </xsl:text>
  <xsl:text>
  </xsl:text>
</xsl:template>


<!-- **********************************************************************
 Utility functions (do not customize)
     ********************************************************************** -->

<!-- *** Find the substring after the last occurence of a separator *** -->
<xsl:template name="last_substring_after">

  <xsl:param name="string"/>
  <xsl:param name="separator"/>
  <xsl:param name="fallback"/>

  <xsl:variable name="newString"
    select="substring-after($string, $separator)"/>

  <xsl:choose>
    <xsl:when test="$newString!=''">
      <xsl:call-template name="last_substring_after">
        <xsl:with-param name="string" select="$newString"/>
        <xsl:with-param name="separator" select="$separator"/>
        <xsl:with-param name="fallback" select="$newString"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$fallback"/>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<!-- *** Find and replace *** -->
<xsl:template name="replace_string">
  <xsl:param name="find"/>
  <xsl:param name="replace"/>
  <xsl:param name="string"/>
  <xsl:choose>
    <xsl:when test="contains($string, $find)">
      <xsl:value-of select="substring-before($string, $find)"/>
      <xsl:value-of select="$replace"/>
      <xsl:call-template name="replace_string">
        <xsl:with-param name="find" select="$find"/>
        <xsl:with-param name="replace" select="$replace"/>
        <xsl:with-param name="string"
          select="substring-after($string, $find)"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$string"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- **********************************************************************
 Display error messages
     ********************************************************************** -->
<xsl:template name="error_page">
  <xsl:param name="errorMessage"/>
  <xsl:param name="errorDescription"/>

  <html>
    <xsl:call-template name="plainHeadStart"/>
      <title><xsl:value-of select="$error_page_title"/></title>
            <xsl:call-template name="style"/>
    <xsl:call-template name="plainHeadEnd"/>
    <body dir="ltr" id="search">

            <xsl:call-template name="analytics"/>
            <xsl:call-template name="my_page_header"/>

            <xsl:if test="$show_logo != '0'">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tr>
                          <td rowspan="3" valign="top">
                          <xsl:call-template name="logo"/>
                          <xsl:call-template name="nbsp3"/>
                        </td>
                  </tr>
                </table>
            </xsl:if>

      <xsl:call-template name="top_sep_bar">
        <xsl:with-param name="text" select="$sep_bar_error_text"/>
                <xsl:with-param name="show_info" select="0"/>
        <xsl:with-param name="time" select="0"/>
      </xsl:call-template>

      <p>
      <table width="99%" border="0" cellpadding="2" cellspacing="0">
        <tr>
          <td><font color="#990000" size="+1">Message:</font></td>
          <td><font color="#990000" size="+1"><xsl:value-of select="$errorMessage"/></font></td>
        </tr>
        <tr>
          <td><font color="#990000">Description:</font></td>
          <td><font color="#990000"><xsl:value-of select="$errorDescription"/></font></td>
        </tr>
        <tr>
          <td><font color="#990000">Details:</font></td>
          <td><font color="#990000"><xsl:copy-of select="/"/></font></td>
        </tr>
      </table>
      </p>

          <hr/>
          <xsl:call-template name="copyright"/>
          <xsl:call-template name="my_page_footer"/>

    </body>
  </html>
</xsl:template>


<!-- **********************************************************************
 Google Desktop for Enterprise integration templates
     ********************************************************************** -->
<xsl:template name="desktop_tab">

  <!-- *** Show the Google tabs *** -->

  <font size="-1">
    <a class="q" onClick="return window.qs?qs(this):1" href="http://www.google.com/search?q={$qval}">Web</a>
  </font>

  <xsl:call-template name="nbsp4"/>

  <font size="-1">
    <a class="q" onClick="return window.qs?qs(this):1" href="http://images.google.com/images?q={$qval}">Images</a>
  </font>

  <xsl:call-template name="nbsp4"/>

  <font size="-1">
    <a class="q" onClick="return window.qs?qs(this):1" href="http://groups.google.com/groups?q={$qval}">Groups</a>
  </font>

  <xsl:call-template name="nbsp4"/>

  <font size="-1">
    <a class="q" onClick="return window.qs?qs(this):1" href="http://news.google.com/news?q={$qval}">News</a>
  </font>

  <xsl:call-template name="nbsp4"/>

  <font size="-1">
    <a class="q" onClick="return window.qs?qs(this):1" href="http://froogle.google.com/froogle?q={$qval}">Froogle</a>
  </font>

  <xsl:call-template name="nbsp4"/>

  <font size="-1">
    <a class="q" onClick="return window.qs?qs(this):1" href="http://local.google.com/local?q={$qval}">Local</a>
  </font>

  <xsl:call-template name="nbsp4"/>

  <!-- *** Show the desktop and web tabs *** -->

  <xsl:if test="CUSTOM/HOME">
    <xsl:comment>trh2</xsl:comment>
  </xsl:if>
  <xsl:if test="Q">
    <xsl:comment>trl2</xsl:comment>
  </xsl:if>

  <!-- *** Show the appliance tab *** -->
  <font size="-1"><strong><xsl:value-of select="$egds_appliance_tab_label"/></strong></font>

</xsl:template>

<xsl:template name="desktop_results">
  <xsl:comment>tro2</xsl:comment>
</xsl:template>

<!-- **********************************************************************
  OneBox results (if any)
     ********************************************************************** -->
<xsl:template name="onebox">
     <xsl:for-each select="/GSP/ENTOBRESULTS">
       <xsl:apply-templates/>
     </xsl:for-each>
</xsl:template>

<!-- **********************************************************************
 Swallow unmatched elements
     ********************************************************************** -->
<xsl:template match="@*|node()"/>
</xsl:stylesheet>


<!-- *** END OF STYLESHEET *** -->








