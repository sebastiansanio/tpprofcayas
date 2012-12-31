<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="layoutlogin" />
  <title>${message(code: 'appname.label')}</title>
</head>
<body>

<hr/>
<div class="row">
<div class="offset4 span4">
  <g:form action="signIn">
    <input type="hidden" name="targetUri" value="${targetUri}" />
    <table>
      <tbody>
        <tr>
          <td>${message(code: 'default.username.label')}</td>
          <td><input type="text" name="username" value="${username}" /></td>
        </tr>
        <tr>
          <td>${message(code: 'default.password.label')}</td>
          <td><input type="password" name="password" value="" /></td>
        </tr>

        <tr>
          <td />
          <td><input type="submit" value="${message(code: 'default.signin.label')}" /></td>
        </tr>
      </tbody>
    </table>
  </g:form>
  </div>
  </div>
<hr/>

</body>
</html>
