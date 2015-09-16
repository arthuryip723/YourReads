YouReads.Views.ReviewForm = Backbone.View.extend({
  template: JST['reviews/form'],
  tagName: 'form',
  events: {
    'click button': 'submit'
  },
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },
  render: function () {
    this.$el.html(this.template({review: this.model}));
    return this;
  },
  submit: function () {
    var attrs = this.$el.serializeJSON();
    var that = this;
    this.model.save(attrs, {
      success: function (model) {
        that.collection.add(model, {merge: true});
        Backbone.history.navigate('#/books/' + model.get('book_id'), {trigger: true});
      }
    });
  }
});