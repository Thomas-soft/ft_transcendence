<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <meta name="robots" content="NONE,NOARCHIVE">
  <title>DisallowedHost
          at /api/accounts/register/</title>
  <style type="text/css">
    html * { padding:0; margin:0; }
    body * { padding:10px 20px; }
    body * * { padding:0; }
    body { font:small sans-serif; background-color:#fff; color:#000; }
    body>div { border-bottom:1px solid #ddd; }
    h1 { font-weight:normal; }
    h2 { margin-bottom:.8em; }
    h3 { margin:1em 0 .5em 0; }
    h4 { margin:0 0 .5em 0; font-weight: normal; }
    code, pre { font-size: 100%; white-space: pre-wrap; }
    summary { cursor: pointer; }
    table { border:1px solid #ccc; border-collapse: collapse; width:100%; background:white; }
    tbody td, tbody th { vertical-align:top; padding:2px 3px; }
    thead th {
      padding:1px 6px 1px 3px; background:#fefefe; text-align:left;
      font-weight:normal; font-size:11px; border:1px solid #ddd;
    }
    tbody th { width:12em; text-align:right; color:#666; padding-right:.5em; }
    table.vars { margin:5px 0 2px 40px; }
    table.vars td, table.req td { font-family:monospace; }
    table td.code { width:100%; }
    table td.code pre { overflow:hidden; }
    table.source th { color:#666; }
    table.source td { font-family:monospace; white-space:pre; border-bottom:1px solid #eee; }
    ul.traceback { list-style-type:none; color: #222; }
    ul.traceback li.frame { padding-bottom:1em; color:#4f4f4f; }
    ul.traceback li.user { background-color:#e0e0e0; color:#000 }
    div.context { padding:10px 0; overflow:hidden; }
    div.context ol { padding-left:30px; margin:0 10px; list-style-position: inside; }
    div.context ol li { font-family:monospace; white-space:pre; color:#777; cursor:pointer; padding-left: 2px; }
    div.context ol li pre { display:inline; }
    div.context ol.context-line li { color:#464646; background-color:#dfdfdf; padding: 3px 2px; }
    div.context ol.context-line li span { position:absolute; right:32px; }
    .user div.context ol.context-line li { background-color:#bbb; color:#000; }
    .user div.context ol li { color:#666; }
    div.commands, summary.commands { margin-left: 40px; }
    div.commands a, summary.commands { color:#555; text-decoration:none; }
    .user div.commands a { color: black; }
    #summary { background: #ffc; }
    #summary h2 { font-weight: normal; color: #666; }
    #explanation { background:#eee; }
    #template, #template-not-exist { background:#f6f6f6; }
    #template-not-exist ul { margin: 0 0 10px 20px; }
    #template-not-exist .postmortem-section { margin-bottom: 3px; }
    #unicode-hint { background:#eee; }
    #traceback { background:#eee; }
    #requestinfo { background:#f6f6f6; padding-left:120px; }
    #summary table { border:none; background:transparent; }
    #requestinfo h2, #requestinfo h3 { position:relative; margin-left:-100px; }
    #requestinfo h3 { margin-bottom:-1em; }
    .error { background: #ffc; }
    .specific { color:#cc3300; font-weight:bold; }
    h2 span.commands { font-size:.7em; font-weight:normal; }
    span.commands a:link {color:#5E5694;}
    pre.exception_value { font-family: sans-serif; color: #575757; font-size: 1.5em; margin: 10px 0 10px 0; }
    .append-bottom { margin-bottom: 10px; }
    .fname { user-select: all; }
  </style>
  
  <script>
    function hideAll(elems) {
      for (var e = 0; e < elems.length; e++) {
        elems[e].style.display = 'none';
      }
    }
    window.onload = function() {
      hideAll(document.querySelectorAll('ol.pre-context'));
      hideAll(document.querySelectorAll('ol.post-context'));
      hideAll(document.querySelectorAll('div.pastebin'));
    }
    function toggle() {
      for (var i = 0; i < arguments.length; i++) {
        var e = document.getElementById(arguments[i]);
        if (e) {
          e.style.display = e.style.display == 'none' ? 'block': 'none';
        }
      }
      return false;
    }
    function switchPastebinFriendly(link) {
      s1 = "Switch to copy-and-paste view";
      s2 = "Switch back to interactive view";
      link.textContent = link.textContent.trim() == s1 ? s2: s1;
      toggle('browserTraceback', 'pastebinTraceback');
      return false;
    }
  </script>
  
</head>
<body>
<div id="summary">
  <h1>DisallowedHost
       at /api/accounts/register/</h1>
  <pre class="exception_value">Invalid HTTP_HOST header: &#x27;back:8000&#x27;. You may need to add &#x27;back&#x27; to ALLOWED_HOSTS.</pre>
  <table class="meta">

    <tr>
      <th>Request Method:</th>
      <td>GET</td>
    </tr>
    <tr>
      <th>Request URL:</th>
      <td>http://back:8000/api/accounts/register/</td>
    </tr>

    <tr>
      <th>Django Version:</th>
      <td>4.0</td>
    </tr>

    <tr>
      <th>Exception Type:</th>
      <td>DisallowedHost</td>
    </tr>


    <tr>
      <th>Exception Value:</th>
      <td><pre>Invalid HTTP_HOST header: &#x27;back:8000&#x27;. You may need to add &#x27;back&#x27; to ALLOWED_HOSTS.</pre></td>
    </tr>


    <tr>
      <th>Exception Location:</th>
      <td><span class="fname">/usr/local/lib/python3.9/site-packages/django/http/request.py</span>, line 135, in get_host</td>
    </tr>

    <tr>
      <th>Python Executable:</th>
      <td>/usr/local/bin/python3.9</td>
    </tr>
    <tr>
      <th>Python Version:</th>
      <td>3.9.20</td>
    </tr>
    <tr>
      <th>Python Path:</th>
      <td><pre>[&#x27;.&#x27;,
 &#x27;/usr/local/bin&#x27;,
 &#x27;/usr/local/lib/python39.zip&#x27;,
 &#x27;/usr/local/lib/python3.9&#x27;,
 &#x27;/usr/local/lib/python3.9/lib-dynload&#x27;,
 &#x27;/usr/local/lib/python3.9/site-packages&#x27;]</pre></td>
    </tr>
    <tr>
      <th>Server time:</th>
      <td>Fri, 29 Nov 2024 16:51:38 +0000</td>
    </tr>
  </table>
</div>




<div id="traceback">
  <h2>Traceback <span class="commands"><a href="#" onclick="return switchPastebinFriendly(this);">
    Switch to copy-and-paste view</a></span>
  </h2>
  <div id="browserTraceback">
    <ul class="traceback">
      
        
        <li class="frame django">
          
            <code class="fname">/usr/local/lib/python3.9/site-packages/django/core/handlers/exception.py</code>, line 38, in inner
          

          
            <div class="context" id="c281473015560448">
              
                <ol start="31" class="pre-context" id="pre281473015560448">
                
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>    no middleware leaks an exception and that the next middleware in the stack</pre></li>
                
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>    can rely on getting a response instead of an exception.</pre></li>
                
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>    &quot;&quot;&quot;</pre></li>
                
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>    if asyncio.iscoroutinefunction(get_response):</pre></li>
                
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>        @wraps(get_response)</pre></li>
                
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>        async def inner(request):</pre></li>
                
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>            try:</pre></li>
                
                </ol>
              
              <ol start="38" class="context-line">
                <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>                response = await get_response(request)</pre> <span>…</span></li>
              </ol>
              
                <ol start='39' class="post-context" id="post281473015560448">
                  
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>            except Exception as exc:</pre></li>
                  
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>                response = await sync_to_async(response_for_exception, thread_sensitive=False)(request, exc)</pre></li>
                  
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>            return response</pre></li>
                  
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>        return inner</pre></li>
                  
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>    else:</pre></li>
                  
                  <li onclick="toggle('pre281473015560448', 'post281473015560448')"><pre>        @wraps(get_response)</pre></li>
                  
              </ol>
              
            </div>
          

          
            
              <details>
                <summary class="commands">Local vars</summary>
            
            <table class="vars" id="v281473015560448">
              <thead>
                <tr>
                  <th>Variable</th>
                  <th>Value</th>
                </tr>
              </thead>
              <tbody>
                
                  <tr>
                    <td>exc</td>
                    <td class="code"><pre>DisallowedHost(&quot;Invalid HTTP_HOST header: &#x27;back:8000&#x27;. You may need to add &#x27;back&#x27; to ALLOWED_HOSTS.&quot;)</pre></td>
                  </tr>
                
                  <tr>
                    <td>get_response</td>
                    <td class="code"><pre>&lt;CommonMiddleware get_response=convert_exception_to_response.&lt;locals&gt;.inner&gt;</pre></td>
                  </tr>
                
                  <tr>
                    <td>request</td>
                    <td class="code"><pre>&lt;ASGIRequest: GET &#x27;/api/accounts/register/&#x27;&gt;</pre></td>
                  </tr>
                
              </tbody>
            </table>
            </details>
          
        </li>
      
        
        <li class="frame django">
          
            <code class="fname">/usr/local/lib/python3.9/site-packages/django/utils/deprecation.py</code>, line 138, in __acall__
          

          
            <div class="context" id="c281473015559872">
              
                <ol start="131" class="pre-context" id="pre281473015559872">
                
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>    async def __acall__(self, request):</pre></li>
                
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>        &quot;&quot;&quot;</pre></li>
                
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>        Async version of __call__ that is swapped in when an async request</pre></li>
                
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>        is running.</pre></li>
                
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>        &quot;&quot;&quot;</pre></li>
                
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>        response = None</pre></li>
                
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>        if hasattr(self, &#x27;process_request&#x27;):</pre></li>
                
                </ol>
              
              <ol start="138" class="context-line">
                <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>            response = await sync_to_async(</pre> <span>…</span></li>
              </ol>
              
                <ol start='139' class="post-context" id="post281473015559872">
                  
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>                self.process_request,</pre></li>
                  
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>                thread_sensitive=True,</pre></li>
                  
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>            )(request)</pre></li>
                  
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>        response = response or await self.get_response(request)</pre></li>
                  
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>        if hasattr(self, &#x27;process_response&#x27;):</pre></li>
                  
                  <li onclick="toggle('pre281473015559872', 'post281473015559872')"><pre>            response = await sync_to_async(</pre></li>
                  
              </ol>
              
            </div>
          

          
            
              <details>
                <summary class="commands">Local vars</summary>
            
            <table class="vars" id="v281473015559872">
              <thead>
                <tr>
                  <th>Variable</th>
                  <th>Value</th>
                </tr>
              </thead>
              <tbody>
                
                  <tr>
                    <td>request</td>
                    <td class="code"><pre>&lt;ASGIRequest: GET &#x27;/api/accounts/register/&#x27;&gt;</pre></td>
                  </tr>
                
                  <tr>
                    <td>response</td>
                    <td class="code"><pre>None</pre></td>
                  </tr>
                
                  <tr>
                    <td>self</td>
                    <td class="code"><pre>&lt;CommonMiddleware get_response=convert_exception_to_response.&lt;locals&gt;.inner&gt;</pre></td>
                  </tr>
                
              </tbody>
            </table>
            </details>
          
        </li>
      
        
        <li class="frame django">
          
            <code class="fname">/usr/local/lib/python3.9/site-packages/django/middleware/common.py</code>, line 48, in process_request
          

          
            <div class="context" id="c281473015560512">
              
                <ol start="41" class="pre-context" id="pre281473015560512">
                
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>        user_agent = request.META.get(&#x27;HTTP_USER_AGENT&#x27;)</pre></li>
                
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>        if user_agent is not None:</pre></li>
                
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>            for user_agent_regex in settings.DISALLOWED_USER_AGENTS:</pre></li>
                
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>                if user_agent_regex.search(user_agent):</pre></li>
                
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>                    raise PermissionDenied(&#x27;Forbidden user agent&#x27;)</pre></li>
                
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre></pre></li>
                
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>        # Check for a redirect based on settings.PREPEND_WWW</pre></li>
                
                </ol>
              
              <ol start="48" class="context-line">
                <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>        host = request.get_host()</pre> <span>…</span></li>
              </ol>
              
                <ol start='49' class="post-context" id="post281473015560512">
                  
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>        must_prepend = settings.PREPEND_WWW and host and not host.startswith(&#x27;www.&#x27;)</pre></li>
                  
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>        redirect_url = (&#x27;%s://www.%s&#x27; % (request.scheme, host)) if must_prepend else &#x27;&#x27;</pre></li>
                  
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre></pre></li>
                  
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>        # Check if a slash should be appended</pre></li>
                  
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>        if self.should_redirect_with_slash(request):</pre></li>
                  
                  <li onclick="toggle('pre281473015560512', 'post281473015560512')"><pre>            path = self.get_full_path_with_slash(request)</pre></li>
                  
              </ol>
              
            </div>
          

          
            
              <details>
                <summary class="commands">Local vars</summary>
            
            <table class="vars" id="v281473015560512">
              <thead>
                <tr>
                  <th>Variable</th>
                  <th>Value</th>
                </tr>
              </thead>
              <tbody>
                
                  <tr>
                    <td>request</td>
                    <td class="code"><pre>&lt;ASGIRequest: GET &#x27;/api/accounts/register/&#x27;&gt;</pre></td>
                  </tr>
                
                  <tr>
                    <td>self</td>
                    <td class="code"><pre>&lt;CommonMiddleware get_response=convert_exception_to_response.&lt;locals&gt;.inner&gt;</pre></td>
                  </tr>
                
                  <tr>
                    <td>user_agent</td>
                    <td class="code"><pre>&#x27;curl/7.88.1&#x27;</pre></td>
                  </tr>
                
              </tbody>
            </table>
            </details>
          
        </li>
      
        
        <li class="frame django">
          
            <code class="fname">/usr/local/lib/python3.9/site-packages/django/http/request.py</code>, line 135, in get_host
          

          
            <div class="context" id="c281473015559232">
              
                <ol start="128" class="pre-context" id="pre281473015559232">
                
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>            return host</pre></li>
                
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>        else:</pre></li>
                
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>            msg = &quot;Invalid HTTP_HOST header: %r.&quot; % host</pre></li>
                
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>            if domain:</pre></li>
                
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>                msg += &quot; You may need to add %r to ALLOWED_HOSTS.&quot; % domain</pre></li>
                
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>            else:</pre></li>
                
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>                msg += &quot; The domain name provided is not valid according to RFC 1034/1035.&quot;</pre></li>
                
                </ol>
              
              <ol start="135" class="context-line">
                <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>            raise DisallowedHost(msg)</pre> <span>…</span></li>
              </ol>
              
                <ol start='136' class="post-context" id="post281473015559232">
                  
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre></pre></li>
                  
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>    def get_port(self):</pre></li>
                  
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>        &quot;&quot;&quot;Return the port number for the request as a string.&quot;&quot;&quot;</pre></li>
                  
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>        if settings.USE_X_FORWARDED_PORT and &#x27;HTTP_X_FORWARDED_PORT&#x27; in self.META:</pre></li>
                  
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>            port = self.META[&#x27;HTTP_X_FORWARDED_PORT&#x27;]</pre></li>
                  
                  <li onclick="toggle('pre281473015559232', 'post281473015559232')"><pre>        else:</pre></li>
                  
              </ol>
              
            </div>
          

          
            
              <details>
                <summary class="commands">Local vars</summary>
            
            <table class="vars" id="v281473015559232">
              <thead>
                <tr>
                  <th>Variable</th>
                  <th>Value</th>
                </tr>
              </thead>
              <tbody>
                
                  <tr>
                    <td>allowed_hosts</td>
                    <td class="code"><pre>[&#x27;.localhost&#x27;, &#x27;127.0.0.1&#x27;, &#x27;[::1]&#x27;]</pre></td>
                  </tr>
                
                  <tr>
                    <td>domain</td>
                    <td class="code"><pre>&#x27;back&#x27;</pre></td>
                  </tr>
                
                  <tr>
                    <td>host</td>
                    <td class="code"><pre>&#x27;back:8000&#x27;</pre></td>
                  </tr>
                
                  <tr>
                    <td>msg</td>
                    <td class="code"><pre>(&quot;Invalid HTTP_HOST header: &#x27;back:8000&#x27;. You may need to add &#x27;back&#x27; to &quot;
 &#x27;ALLOWED_HOSTS.&#x27;)</pre></td>
                  </tr>
                
                  <tr>
                    <td>port</td>
                    <td class="code"><pre>&#x27;8000&#x27;</pre></td>
                  </tr>
                
                  <tr>
                    <td>self</td>
                    <td class="code"><pre>&lt;ASGIRequest: GET &#x27;/api/accounts/register/&#x27;&gt;</pre></td>
                  </tr>
                
              </tbody>
            </table>
            </details>
          
        </li>
      
    </ul>
  </div>

  <form action="https://dpaste.com/" name="pasteform" id="pasteform" method="post">
  <div id="pastebinTraceback" class="pastebin">
    <input type="hidden" name="language" value="PythonConsole">
    <input type="hidden" name="title"
      value="DisallowedHost at /api/accounts/register/">
    <input type="hidden" name="source" value="Django Dpaste Agent">
    <input type="hidden" name="poster" value="Django">
    <textarea name="content" id="traceback_area" cols="140" rows="25">
Environment:


Request Method: GET
Request URL: http://back:8000/api/accounts/register/

Django Version: 4.0
Python Version: 3.9.20
Installed Applications:
[&#x27;django.contrib.admin&#x27;,
 &#x27;django.contrib.auth&#x27;,
 &#x27;django.contrib.contenttypes&#x27;,
 &#x27;django.contrib.sessions&#x27;,
 &#x27;django.contrib.messages&#x27;,
 &#x27;django.contrib.staticfiles&#x27;,
 &#x27;corsheaders&#x27;,
 &#x27;rest_framework&#x27;,
 &#x27;rest_framework_simplejwt&#x27;,
 &#x27;accounts&#x27;,
 &#x27;authentification&#x27;]
Installed Middleware:
[&#x27;whitenoise.middleware.WhiteNoiseMiddleware&#x27;,
 &#x27;corsheaders.middleware.CorsMiddleware&#x27;,
 &#x27;django.middleware.security.SecurityMiddleware&#x27;,
 &#x27;django.contrib.sessions.middleware.SessionMiddleware&#x27;,
 &#x27;django.middleware.common.CommonMiddleware&#x27;,
 &#x27;django.middleware.csrf.CsrfViewMiddleware&#x27;,
 &#x27;django.contrib.auth.middleware.AuthenticationMiddleware&#x27;,
 &#x27;django.contrib.messages.middleware.MessageMiddleware&#x27;,
 &#x27;django.middleware.clickjacking.XFrameOptionsMiddleware&#x27;]



Traceback (most recent call last):
  File "/usr/local/lib/python3.9/site-packages/django/core/handlers/exception.py", line 38, in inner
    response = await get_response(request)
  File "/usr/local/lib/python3.9/site-packages/django/utils/deprecation.py", line 138, in __acall__
    response = await sync_to_async(
  File "/usr/local/lib/python3.9/site-packages/django/middleware/common.py", line 48, in process_request
    host = request.get_host()
  File "/usr/local/lib/python3.9/site-packages/django/http/request.py", line 135, in get_host
    raise DisallowedHost(msg)

Exception Type: DisallowedHost at /api/accounts/register/
Exception Value: Invalid HTTP_HOST header: &#x27;back:8000&#x27;. You may need to add &#x27;back&#x27; to ALLOWED_HOSTS.
</textarea>
  <br><br>
  <input type="submit" value="Share this traceback on a public website">
  </div>
</form>

</div>


<div id="requestinfo">
  <h2>Request information</h2>


  
    <h3 id="user-info">USER</h3>
    <p>[unable to retrieve the current user]</p>
  

  <h3 id="get-info">GET</h3>
  
    <p>No GET data</p>
  

  <h3 id="post-info">POST</h3>
  
    <p>No POST data</p>
  
  <h3 id="files-info">FILES</h3>
  
    <p>No FILES data</p>
  


  <h3 id="cookie-info">COOKIES</h3>
  
    <p>No cookie data</p>
  

  <h3 id="meta-info">META</h3>
  <table class="req">
    <thead>
      <tr>
        <th>Variable</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      
        <tr>
          <td>HTTP_ACCEPT</td>
          <td class="code"><pre>&#x27;*/*&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>HTTP_HOST</td>
          <td class="code"><pre>&#x27;back:8000&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>HTTP_USER_AGENT</td>
          <td class="code"><pre>&#x27;curl/7.88.1&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>PATH_INFO</td>
          <td class="code"><pre>&#x27;/api/accounts/register/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>QUERY_STRING</td>
          <td class="code"><pre>&#x27;&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>REMOTE_ADDR</td>
          <td class="code"><pre>&#x27;172.18.0.6&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>REMOTE_HOST</td>
          <td class="code"><pre>&#x27;172.18.0.6&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>REMOTE_PORT</td>
          <td class="code"><pre>44046</pre></td>
        </tr>
      
        <tr>
          <td>REQUEST_METHOD</td>
          <td class="code"><pre>&#x27;GET&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SCRIPT_NAME</td>
          <td class="code"><pre>&#x27;&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SERVER_NAME</td>
          <td class="code"><pre>&#x27;172.18.0.5&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SERVER_PORT</td>
          <td class="code"><pre>&#x27;8000&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>wsgi.multiprocess</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>wsgi.multithread</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
    </tbody>
  </table>


  <h3 id="settings-info">Settings</h3>
  <h4>Using settings module <code>back.settings</code></h4>
  <table class="req">
    <thead>
      <tr>
        <th>Setting</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      
        <tr>
          <td>ABSOLUTE_URL_OVERRIDES</td>
          <td class="code"><pre>{}</pre></td>
        </tr>
      
        <tr>
          <td>ADMINS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>ALLOWED_HOSTS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>APPEND_SLASH</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>AUTHENTICATION_BACKENDS</td>
          <td class="code"><pre>[&#x27;django.contrib.auth.backends.ModelBackend&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>AUTH_PASSWORD_VALIDATORS</td>
          <td class="code"><pre>&#x27;********************&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>AUTH_USER_MODEL</td>
          <td class="code"><pre>&#x27;accounts.User&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>BASE_DIR</td>
          <td class="code"><pre>PosixPath(&#x27;/app&#x27;)</pre></td>
        </tr>
      
        <tr>
          <td>CACHES</td>
          <td class="code"><pre>{&#x27;default&#x27;: {&#x27;BACKEND&#x27;: &#x27;django.core.cache.backends.locmem.LocMemCache&#x27;}}</pre></td>
        </tr>
      
        <tr>
          <td>CACHE_MIDDLEWARE_ALIAS</td>
          <td class="code"><pre>&#x27;default&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>CACHE_MIDDLEWARE_KEY_PREFIX</td>
          <td class="code"><pre>&#x27;********************&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>CACHE_MIDDLEWARE_SECONDS</td>
          <td class="code"><pre>600</pre></td>
        </tr>
      
        <tr>
          <td>CORS_ALLOWED_ORIGINS</td>
          <td class="code"><pre>[&#x27;https://localhost&#x27;,
 &#x27;http://localhost&#x27;,
 &#x27;http://127.0.0.1:8000&#x27;,
 &#x27;http://localhost:8000&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>CORS_ALLOW_ALL_ORIGINS</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>CORS_ALLOW_CREDENTIALS</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_COOKIE_AGE</td>
          <td class="code"><pre>31449600</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_COOKIE_DOMAIN</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_COOKIE_HTTPONLY</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_COOKIE_NAME</td>
          <td class="code"><pre>&#x27;csrftoken&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_COOKIE_PATH</td>
          <td class="code"><pre>&#x27;/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_COOKIE_SAMESITE</td>
          <td class="code"><pre>&#x27;Lax&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_COOKIE_SECURE</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_FAILURE_VIEW</td>
          <td class="code"><pre>&#x27;django.views.csrf.csrf_failure&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_HEADER_NAME</td>
          <td class="code"><pre>&#x27;HTTP_X_CSRFTOKEN&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_TRUSTED_ORIGINS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>CSRF_USE_SESSIONS</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>DATABASES</td>
          <td class="code"><pre>{&#x27;default&#x27;: {&#x27;ATOMIC_REQUESTS&#x27;: False,
             &#x27;AUTOCOMMIT&#x27;: True,
             &#x27;CONN_MAX_AGE&#x27;: 0,
             &#x27;ENGINE&#x27;: &#x27;django.db.backends.postgresql&#x27;,
             &#x27;HOST&#x27;: &#x27;db&#x27;,
             &#x27;NAME&#x27;: &#x27;mydb&#x27;,
             &#x27;OPTIONS&#x27;: {},
             &#x27;PASSWORD&#x27;: &#x27;********************&#x27;,
             &#x27;PORT&#x27;: &#x27;5432&#x27;,
             &#x27;TEST&#x27;: {&#x27;CHARSET&#x27;: None,
                      &#x27;COLLATION&#x27;: None,
                      &#x27;MIGRATE&#x27;: True,
                      &#x27;MIRROR&#x27;: None,
                      &#x27;NAME&#x27;: None},
             &#x27;TIME_ZONE&#x27;: None,
             &#x27;USER&#x27;: &#x27;myuser&#x27;}}</pre></td>
        </tr>
      
        <tr>
          <td>DATABASE_ROUTERS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>DATA_UPLOAD_MAX_MEMORY_SIZE</td>
          <td class="code"><pre>2621440</pre></td>
        </tr>
      
        <tr>
          <td>DATA_UPLOAD_MAX_NUMBER_FIELDS</td>
          <td class="code"><pre>1000</pre></td>
        </tr>
      
        <tr>
          <td>DATETIME_FORMAT</td>
          <td class="code"><pre>&#x27;N j, Y, P&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DATETIME_INPUT_FORMATS</td>
          <td class="code"><pre>[&#x27;%Y-%m-%d %H:%M:%S&#x27;,
 &#x27;%Y-%m-%d %H:%M:%S.%f&#x27;,
 &#x27;%Y-%m-%d %H:%M&#x27;,
 &#x27;%m/%d/%Y %H:%M:%S&#x27;,
 &#x27;%m/%d/%Y %H:%M:%S.%f&#x27;,
 &#x27;%m/%d/%Y %H:%M&#x27;,
 &#x27;%m/%d/%y %H:%M:%S&#x27;,
 &#x27;%m/%d/%y %H:%M:%S.%f&#x27;,
 &#x27;%m/%d/%y %H:%M&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>DATE_FORMAT</td>
          <td class="code"><pre>&#x27;N j, Y&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DATE_INPUT_FORMATS</td>
          <td class="code"><pre>[&#x27;%Y-%m-%d&#x27;,
 &#x27;%m/%d/%Y&#x27;,
 &#x27;%m/%d/%y&#x27;,
 &#x27;%b %d %Y&#x27;,
 &#x27;%b %d, %Y&#x27;,
 &#x27;%d %b %Y&#x27;,
 &#x27;%d %b, %Y&#x27;,
 &#x27;%B %d %Y&#x27;,
 &#x27;%B %d, %Y&#x27;,
 &#x27;%d %B %Y&#x27;,
 &#x27;%d %B, %Y&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>DEBUG</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>DEBUG_PROPAGATE_EXCEPTIONS</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>DECIMAL_SEPARATOR</td>
          <td class="code"><pre>&#x27;.&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DEFAULT_AUTO_FIELD</td>
          <td class="code"><pre>&#x27;django.db.models.BigAutoField&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DEFAULT_CHARSET</td>
          <td class="code"><pre>&#x27;utf-8&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DEFAULT_EXCEPTION_REPORTER</td>
          <td class="code"><pre>&#x27;django.views.debug.ExceptionReporter&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DEFAULT_EXCEPTION_REPORTER_FILTER</td>
          <td class="code"><pre>&#x27;django.views.debug.SafeExceptionReporterFilter&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DEFAULT_FILE_STORAGE</td>
          <td class="code"><pre>&#x27;django.core.files.storage.FileSystemStorage&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DEFAULT_FROM_EMAIL</td>
          <td class="code"><pre>&#x27;webmaster@localhost&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DEFAULT_INDEX_TABLESPACE</td>
          <td class="code"><pre>&#x27;&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DEFAULT_TABLESPACE</td>
          <td class="code"><pre>&#x27;&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>DISALLOWED_USER_AGENTS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_BACKEND</td>
          <td class="code"><pre>&#x27;django.core.mail.backends.smtp.EmailBackend&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_HOST</td>
          <td class="code"><pre>&#x27;localhost&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_HOST_PASSWORD</td>
          <td class="code"><pre>&#x27;********************&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_HOST_USER</td>
          <td class="code"><pre>&#x27;&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_PORT</td>
          <td class="code"><pre>25</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_SSL_CERTFILE</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_SSL_KEYFILE</td>
          <td class="code"><pre>&#x27;********************&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_SUBJECT_PREFIX</td>
          <td class="code"><pre>&#x27;[Django] &#x27;</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_TIMEOUT</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_USE_LOCALTIME</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_USE_SSL</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>EMAIL_USE_TLS</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>FILE_UPLOAD_DIRECTORY_PERMISSIONS</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>FILE_UPLOAD_HANDLERS</td>
          <td class="code"><pre>[&#x27;django.core.files.uploadhandler.MemoryFileUploadHandler&#x27;,
 &#x27;django.core.files.uploadhandler.TemporaryFileUploadHandler&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>FILE_UPLOAD_MAX_MEMORY_SIZE</td>
          <td class="code"><pre>2621440</pre></td>
        </tr>
      
        <tr>
          <td>FILE_UPLOAD_PERMISSIONS</td>
          <td class="code"><pre>420</pre></td>
        </tr>
      
        <tr>
          <td>FILE_UPLOAD_TEMP_DIR</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>FIRST_DAY_OF_WEEK</td>
          <td class="code"><pre>0</pre></td>
        </tr>
      
        <tr>
          <td>FIXTURE_DIRS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>FORCE_SCRIPT_NAME</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>FORMAT_MODULE_PATH</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>FORM_RENDERER</td>
          <td class="code"><pre>&#x27;django.forms.renderers.DjangoTemplates&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>IGNORABLE_404_URLS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>INSTALLED_APPS</td>
          <td class="code"><pre>[&#x27;django.contrib.admin&#x27;,
 &#x27;django.contrib.auth&#x27;,
 &#x27;django.contrib.contenttypes&#x27;,
 &#x27;django.contrib.sessions&#x27;,
 &#x27;django.contrib.messages&#x27;,
 &#x27;django.contrib.staticfiles&#x27;,
 &#x27;corsheaders&#x27;,
 &#x27;rest_framework&#x27;,
 &#x27;rest_framework_simplejwt&#x27;,
 &#x27;accounts&#x27;,
 &#x27;authentification&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>INTERNAL_IPS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGES</td>
          <td class="code"><pre>[(&#x27;af&#x27;, &#x27;Afrikaans&#x27;),
 (&#x27;ar&#x27;, &#x27;Arabic&#x27;),
 (&#x27;ar-dz&#x27;, &#x27;Algerian Arabic&#x27;),
 (&#x27;ast&#x27;, &#x27;Asturian&#x27;),
 (&#x27;az&#x27;, &#x27;Azerbaijani&#x27;),
 (&#x27;bg&#x27;, &#x27;Bulgarian&#x27;),
 (&#x27;be&#x27;, &#x27;Belarusian&#x27;),
 (&#x27;bn&#x27;, &#x27;Bengali&#x27;),
 (&#x27;br&#x27;, &#x27;Breton&#x27;),
 (&#x27;bs&#x27;, &#x27;Bosnian&#x27;),
 (&#x27;ca&#x27;, &#x27;Catalan&#x27;),
 (&#x27;cs&#x27;, &#x27;Czech&#x27;),
 (&#x27;cy&#x27;, &#x27;Welsh&#x27;),
 (&#x27;da&#x27;, &#x27;Danish&#x27;),
 (&#x27;de&#x27;, &#x27;German&#x27;),
 (&#x27;dsb&#x27;, &#x27;Lower Sorbian&#x27;),
 (&#x27;el&#x27;, &#x27;Greek&#x27;),
 (&#x27;en&#x27;, &#x27;English&#x27;),
 (&#x27;en-au&#x27;, &#x27;Australian English&#x27;),
 (&#x27;en-gb&#x27;, &#x27;British English&#x27;),
 (&#x27;eo&#x27;, &#x27;Esperanto&#x27;),
 (&#x27;es&#x27;, &#x27;Spanish&#x27;),
 (&#x27;es-ar&#x27;, &#x27;Argentinian Spanish&#x27;),
 (&#x27;es-co&#x27;, &#x27;Colombian Spanish&#x27;),
 (&#x27;es-mx&#x27;, &#x27;Mexican Spanish&#x27;),
 (&#x27;es-ni&#x27;, &#x27;Nicaraguan Spanish&#x27;),
 (&#x27;es-ve&#x27;, &#x27;Venezuelan Spanish&#x27;),
 (&#x27;et&#x27;, &#x27;Estonian&#x27;),
 (&#x27;eu&#x27;, &#x27;Basque&#x27;),
 (&#x27;fa&#x27;, &#x27;Persian&#x27;),
 (&#x27;fi&#x27;, &#x27;Finnish&#x27;),
 (&#x27;fr&#x27;, &#x27;French&#x27;),
 (&#x27;fy&#x27;, &#x27;Frisian&#x27;),
 (&#x27;ga&#x27;, &#x27;Irish&#x27;),
 (&#x27;gd&#x27;, &#x27;Scottish Gaelic&#x27;),
 (&#x27;gl&#x27;, &#x27;Galician&#x27;),
 (&#x27;he&#x27;, &#x27;Hebrew&#x27;),
 (&#x27;hi&#x27;, &#x27;Hindi&#x27;),
 (&#x27;hr&#x27;, &#x27;Croatian&#x27;),
 (&#x27;hsb&#x27;, &#x27;Upper Sorbian&#x27;),
 (&#x27;hu&#x27;, &#x27;Hungarian&#x27;),
 (&#x27;hy&#x27;, &#x27;Armenian&#x27;),
 (&#x27;ia&#x27;, &#x27;Interlingua&#x27;),
 (&#x27;id&#x27;, &#x27;Indonesian&#x27;),
 (&#x27;ig&#x27;, &#x27;Igbo&#x27;),
 (&#x27;io&#x27;, &#x27;Ido&#x27;),
 (&#x27;is&#x27;, &#x27;Icelandic&#x27;),
 (&#x27;it&#x27;, &#x27;Italian&#x27;),
 (&#x27;ja&#x27;, &#x27;Japanese&#x27;),
 (&#x27;ka&#x27;, &#x27;Georgian&#x27;),
 (&#x27;kab&#x27;, &#x27;Kabyle&#x27;),
 (&#x27;kk&#x27;, &#x27;Kazakh&#x27;),
 (&#x27;km&#x27;, &#x27;Khmer&#x27;),
 (&#x27;kn&#x27;, &#x27;Kannada&#x27;),
 (&#x27;ko&#x27;, &#x27;Korean&#x27;),
 (&#x27;ky&#x27;, &#x27;Kyrgyz&#x27;),
 (&#x27;lb&#x27;, &#x27;Luxembourgish&#x27;),
 (&#x27;lt&#x27;, &#x27;Lithuanian&#x27;),
 (&#x27;lv&#x27;, &#x27;Latvian&#x27;),
 (&#x27;mk&#x27;, &#x27;Macedonian&#x27;),
 (&#x27;ml&#x27;, &#x27;Malayalam&#x27;),
 (&#x27;mn&#x27;, &#x27;Mongolian&#x27;),
 (&#x27;mr&#x27;, &#x27;Marathi&#x27;),
 (&#x27;ms&#x27;, &#x27;Malay&#x27;),
 (&#x27;my&#x27;, &#x27;Burmese&#x27;),
 (&#x27;nb&#x27;, &#x27;Norwegian Bokmål&#x27;),
 (&#x27;ne&#x27;, &#x27;Nepali&#x27;),
 (&#x27;nl&#x27;, &#x27;Dutch&#x27;),
 (&#x27;nn&#x27;, &#x27;Norwegian Nynorsk&#x27;),
 (&#x27;os&#x27;, &#x27;Ossetic&#x27;),
 (&#x27;pa&#x27;, &#x27;Punjabi&#x27;),
 (&#x27;pl&#x27;, &#x27;Polish&#x27;),
 (&#x27;pt&#x27;, &#x27;Portuguese&#x27;),
 (&#x27;pt-br&#x27;, &#x27;Brazilian Portuguese&#x27;),
 (&#x27;ro&#x27;, &#x27;Romanian&#x27;),
 (&#x27;ru&#x27;, &#x27;Russian&#x27;),
 (&#x27;sk&#x27;, &#x27;Slovak&#x27;),
 (&#x27;sl&#x27;, &#x27;Slovenian&#x27;),
 (&#x27;sq&#x27;, &#x27;Albanian&#x27;),
 (&#x27;sr&#x27;, &#x27;Serbian&#x27;),
 (&#x27;sr-latn&#x27;, &#x27;Serbian Latin&#x27;),
 (&#x27;sv&#x27;, &#x27;Swedish&#x27;),
 (&#x27;sw&#x27;, &#x27;Swahili&#x27;),
 (&#x27;ta&#x27;, &#x27;Tamil&#x27;),
 (&#x27;te&#x27;, &#x27;Telugu&#x27;),
 (&#x27;tg&#x27;, &#x27;Tajik&#x27;),
 (&#x27;th&#x27;, &#x27;Thai&#x27;),
 (&#x27;tk&#x27;, &#x27;Turkmen&#x27;),
 (&#x27;tr&#x27;, &#x27;Turkish&#x27;),
 (&#x27;tt&#x27;, &#x27;Tatar&#x27;),
 (&#x27;udm&#x27;, &#x27;Udmurt&#x27;),
 (&#x27;uk&#x27;, &#x27;Ukrainian&#x27;),
 (&#x27;ur&#x27;, &#x27;Urdu&#x27;),
 (&#x27;uz&#x27;, &#x27;Uzbek&#x27;),
 (&#x27;vi&#x27;, &#x27;Vietnamese&#x27;),
 (&#x27;zh-hans&#x27;, &#x27;Simplified Chinese&#x27;),
 (&#x27;zh-hant&#x27;, &#x27;Traditional Chinese&#x27;)]</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGES_BIDI</td>
          <td class="code"><pre>[&#x27;he&#x27;, &#x27;ar&#x27;, &#x27;ar-dz&#x27;, &#x27;fa&#x27;, &#x27;ur&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGE_CODE</td>
          <td class="code"><pre>&#x27;en-us&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGE_COOKIE_AGE</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGE_COOKIE_DOMAIN</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGE_COOKIE_HTTPONLY</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGE_COOKIE_NAME</td>
          <td class="code"><pre>&#x27;django_language&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGE_COOKIE_PATH</td>
          <td class="code"><pre>&#x27;/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGE_COOKIE_SAMESITE</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>LANGUAGE_COOKIE_SECURE</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>LOCALE_PATHS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>LOGGING</td>
          <td class="code"><pre>{}</pre></td>
        </tr>
      
        <tr>
          <td>LOGGING_CONFIG</td>
          <td class="code"><pre>&#x27;logging.config.dictConfig&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>LOGIN_REDIRECT_URL</td>
          <td class="code"><pre>&#x27;/accounts/profile/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>LOGIN_URL</td>
          <td class="code"><pre>&#x27;/accounts/login/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>LOGOUT_REDIRECT_URL</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>MANAGERS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>MEDIA_ROOT</td>
          <td class="code"><pre>&#x27;/app/static/media&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>MEDIA_URL</td>
          <td class="code"><pre>&#x27;/media/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>MESSAGE_STORAGE</td>
          <td class="code"><pre>&#x27;django.contrib.messages.storage.fallback.FallbackStorage&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>MIDDLEWARE</td>
          <td class="code"><pre>[&#x27;whitenoise.middleware.WhiteNoiseMiddleware&#x27;,
 &#x27;corsheaders.middleware.CorsMiddleware&#x27;,
 &#x27;django.middleware.security.SecurityMiddleware&#x27;,
 &#x27;django.contrib.sessions.middleware.SessionMiddleware&#x27;,
 &#x27;django.middleware.common.CommonMiddleware&#x27;,
 &#x27;django.middleware.csrf.CsrfViewMiddleware&#x27;,
 &#x27;django.contrib.auth.middleware.AuthenticationMiddleware&#x27;,
 &#x27;django.contrib.messages.middleware.MessageMiddleware&#x27;,
 &#x27;django.middleware.clickjacking.XFrameOptionsMiddleware&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>MIGRATION_MODULES</td>
          <td class="code"><pre>{}</pre></td>
        </tr>
      
        <tr>
          <td>MONTH_DAY_FORMAT</td>
          <td class="code"><pre>&#x27;F j&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>NUMBER_GROUPING</td>
          <td class="code"><pre>0</pre></td>
        </tr>
      
        <tr>
          <td>PASSWORD_HASHERS</td>
          <td class="code"><pre>&#x27;********************&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>PASSWORD_RESET_TIMEOUT</td>
          <td class="code"><pre>&#x27;********************&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>PREPEND_WWW</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>REST_FRAMEWORK</td>
          <td class="code"><pre>{&#x27;DEFAULT_AUTHENTICATION_CLASSES&#x27;: (&#x27;authentification.jwt.CookiesJWTAuthentication&#x27;,),
 &#x27;DEFAULT_PERMISSION_CLASSES&#x27;: (&#x27;rest_framework.permissions.IsAuthenticated&#x27;,)}</pre></td>
        </tr>
      
        <tr>
          <td>ROOT_URLCONF</td>
          <td class="code"><pre>&#x27;back.urls&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SECRET_KEY</td>
          <td class="code"><pre>&#x27;********************&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_CONTENT_TYPE_NOSNIFF</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_CROSS_ORIGIN_OPENER_POLICY</td>
          <td class="code"><pre>&#x27;same-origin&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_HSTS_INCLUDE_SUBDOMAINS</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_HSTS_PRELOAD</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_HSTS_SECONDS</td>
          <td class="code"><pre>0</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_PROXY_SSL_HEADER</td>
          <td class="code"><pre>(&#x27;HTTP_X_FORWARDED_PROTO&#x27;, &#x27;https&#x27;)</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_REDIRECT_EXEMPT</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_REFERRER_POLICY</td>
          <td class="code"><pre>&#x27;same-origin&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_SSL_HOST</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>SECURE_SSL_REDIRECT</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>SERVER_EMAIL</td>
          <td class="code"><pre>&#x27;root@localhost&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_CACHE_ALIAS</td>
          <td class="code"><pre>&#x27;default&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_COOKIE_AGE</td>
          <td class="code"><pre>1209600</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_COOKIE_DOMAIN</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_COOKIE_HTTPONLY</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_COOKIE_NAME</td>
          <td class="code"><pre>&#x27;sessionid&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_COOKIE_PATH</td>
          <td class="code"><pre>&#x27;/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_COOKIE_SAMESITE</td>
          <td class="code"><pre>&#x27;Lax&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_COOKIE_SECURE</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_ENGINE</td>
          <td class="code"><pre>&#x27;django.contrib.sessions.backends.db&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_EXPIRE_AT_BROWSER_CLOSE</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_FILE_PATH</td>
          <td class="code"><pre>None</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_SAVE_EVERY_REQUEST</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>SESSION_SERIALIZER</td>
          <td class="code"><pre>&#x27;django.contrib.sessions.serializers.JSONSerializer&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SETTINGS_MODULE</td>
          <td class="code"><pre>&#x27;back.settings&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SHORT_DATETIME_FORMAT</td>
          <td class="code"><pre>&#x27;m/d/Y P&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SHORT_DATE_FORMAT</td>
          <td class="code"><pre>&#x27;m/d/Y&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SIGNING_BACKEND</td>
          <td class="code"><pre>&#x27;django.core.signing.TimestampSigner&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>SILENCED_SYSTEM_CHECKS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>SIMPLE_JWT</td>
          <td class="code"><pre>{&#x27;ACCESS_TOKEN_LIFETIME&#x27;: &#x27;********************&#x27;,
 &#x27;AUTH_HEADER_TYPES&#x27;: (&#x27;Bearer&#x27;,),
 &#x27;REFRESH_TOKEN_LIFETIME&#x27;: &#x27;********************&#x27;}</pre></td>
        </tr>
      
        <tr>
          <td>STATICFILES_DIRS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>STATICFILES_FINDERS</td>
          <td class="code"><pre>[&#x27;django.contrib.staticfiles.finders.FileSystemFinder&#x27;,
 &#x27;django.contrib.staticfiles.finders.AppDirectoriesFinder&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>STATICFILES_STORAGE</td>
          <td class="code"><pre>&#x27;django.contrib.staticfiles.storage.StaticFilesStorage&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>STATIC_ROOT</td>
          <td class="code"><pre>&#x27;/app/staticfiles/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>STATIC_URL</td>
          <td class="code"><pre>&#x27;/static/&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>TEMPLATES</td>
          <td class="code"><pre>[{&#x27;APP_DIRS&#x27;: True,
  &#x27;BACKEND&#x27;: &#x27;django.template.backends.django.DjangoTemplates&#x27;,
  &#x27;DIRS&#x27;: [],
  &#x27;OPTIONS&#x27;: {&#x27;context_processors&#x27;: [&#x27;django.template.context_processors.debug&#x27;,
                                     &#x27;django.template.context_processors.request&#x27;,
                                     &#x27;django.contrib.auth.context_processors.auth&#x27;,
                                     &#x27;django.contrib.messages.context_processors.messages&#x27;]}}]</pre></td>
        </tr>
      
        <tr>
          <td>TEST_NON_SERIALIZED_APPS</td>
          <td class="code"><pre>[]</pre></td>
        </tr>
      
        <tr>
          <td>TEST_RUNNER</td>
          <td class="code"><pre>&#x27;django.test.runner.DiscoverRunner&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>THOUSAND_SEPARATOR</td>
          <td class="code"><pre>&#x27;,&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>TIME_FORMAT</td>
          <td class="code"><pre>&#x27;P&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>TIME_INPUT_FORMATS</td>
          <td class="code"><pre>[&#x27;%H:%M:%S&#x27;, &#x27;%H:%M:%S.%f&#x27;, &#x27;%H:%M&#x27;]</pre></td>
        </tr>
      
        <tr>
          <td>TIME_ZONE</td>
          <td class="code"><pre>&#x27;UTC&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>USE_DEPRECATED_PYTZ</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>USE_I18N</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>USE_L10N</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>USE_THOUSAND_SEPARATOR</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>USE_TZ</td>
          <td class="code"><pre>True</pre></td>
        </tr>
      
        <tr>
          <td>USE_X_FORWARDED_HOST</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>USE_X_FORWARDED_PORT</td>
          <td class="code"><pre>False</pre></td>
        </tr>
      
        <tr>
          <td>WSGI_APPLICATION</td>
          <td class="code"><pre>&#x27;back.wsgi.application&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>X_FRAME_OPTIONS</td>
          <td class="code"><pre>&#x27;DENY&#x27;</pre></td>
        </tr>
      
        <tr>
          <td>YEAR_MONTH_FORMAT</td>
          <td class="code"><pre>&#x27;F Y&#x27;</pre></td>
        </tr>
      
    </tbody>
  </table>

</div>

  <div id="explanation">
    <p>
      You’re seeing this error because you have <code>DEBUG = True</code> in your
      Django settings file. Change that to <code>False</code>, and Django will
      display a standard page generated by the handler for this status code.
    </p>
  </div>

</body>
</html>
