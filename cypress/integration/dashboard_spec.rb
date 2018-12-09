describe('Dashboard', function() {
  it('loads successfully', function() {
    cy.visit('/')
    cy.get('h1').should('contain', 'Upcoming')
  })

  context('Upcoming list of tasks', function() {
    it('displays instruction if no upcoming tasks exist', function() {
      // cy.exec('rails db:reset')
    })


    it('displays list of upcoming tasks', function() {
      cy.get('.upcoming-list')
    })

    it('displays task title and next due date', function() {
      let task = {
        'title': "Taskie task",
        'due': 2018-12-12
      }
      cy.get('ul')
      .children('li')
      .contains(task.title)
    })

    it('displays list of tasks in chronological order')





  })

})