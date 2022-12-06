describe('Teste para Prova', () => {
  it('Testar Alertas', () => {
    cy.visit('https://demoqa.com/text-box')
    const name = generateName(20)
    cy.get('#userName').type(name)
    cy.get('#submit').click()
    cy.get('#name').should("contain.text", "Name:"+name)
  })
  it('Testar botão de duplo click', ()=>{
    cy.visit('https://demoqa.com/buttons')
    cy.get('#doubleClickBtn').click()
    cy.get('#doubleClickMessage').should("not.exist") //teste negativo 
    cy.get('#doubleClickBtn').dblclick()
    cy.get('#doubleClickMessage').should("exist").should("contain.text", "You have done a double click")
  })
  it('Testar collapse', ()=>{
    cy.visit('https://demoqa.com/checkbox')
    cy.get('#tree-node > ol > li').should('have.class', 'rct-node-collapsed')
    cy.get('#tree-node > ol > li > span > button').click()
    cy.get('#tree-node > ol > li').should('not.have.class', 'rct-node-collapsed')
  })
})

function generateName(length){
  let string = ''
  for(let i=0;i<length;i++){
    let randDigit = String.fromCharCode(Math.ceil(Math.random()*26)+97)
    string += randDigit
  }
  return string
}