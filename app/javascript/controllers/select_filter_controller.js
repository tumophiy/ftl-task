import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "expenses" ]

  connect() {
    this.filters =  { categories: [], values: []}
  }

  publisherChange(event) {
    this.filters.values = getSelectedValues(event)
    this.change()
  }

  categoryChange(event) {
    this.filters.categories = getSelectedValues(event)
    this.change()
  }

  change() {
    fetch(this.data.get("url"), {
      method: 'POST',
      body: JSON.stringify( this.filters ),
      credentials: "include",
      dataType: 'script',
      headers: {
        "X-CSRF-Token": getMetaValue("csrf-token"),
        "Content-Type": "application/json"
      },
    })
      .then(response => response.text())
      .then(html => {
        this.booksTarget.innerHTML = html
      })
  }
}

function getSelectedValues(event) {
  return [...event.target.selectedOptions].map(option => option.value)
}

function getMetaValue(name) {
  const element = document.head.querySelector(`meta[name="${name}"]`)
  return element.getAttribute("content")
}
