require 'test_helper'

class CommentCrudTest < Minitest::Spec
  let (:thing){ Thing::Create.(thing: {name: "Rails", description: "Web framework"}).model }
  let (:valid_comment) {{
    comment: {
      body: "Fantastic!",
      weight: "0",
      user: {email: "test@mail.com"}
    },
    thing_id: thing.id
  }}

  describe "Create" do
    it "persisted valid" do
      res, op = Comment::Create.run(valid_comment)
      comment = op.model
      comment.persisted?.must_equal true
      comment.body.must_equal "Fantastic!"
      comment.weight.must_equal 0

      comment.user.persisted?.must_equal true
      comment.user.email.must_equal "test@mail.com"
    end

    it "invalid email" do
      invalid_email = valid_comment.merge({user: {email: "invalid@"}})
      puts invalid_email
      res, op = Comment::Create.run(invalid_email)
      res.must_equal false
    end
  end
end
