const input = document.querySelector('#addressJs');
  const text = document.querySelector('#addressText');
  console.log(text)
  console.log(input)
  input.addEventListener("focusout", () => {
    text.innerText = " "

  })
