(define (stream pick-and-place)
  (:function (Distance ?q1 ?q2)
    (and (Conf ?q1) (Conf ?q2))
  )

  (:predicate (PoseCollision ?b1 ?p1 ?b2 ?p2)
    (and (Pose ?b1 ?p1) (Pose ?b2 ?p2))
  )
  (:predicate (TrajCollision ?t ?b2 ?p2)
    (and (Traj ?t) (Pose ?b2 ?p2))
  )

  (:stream sample-pose
    :inputs (?b ?r)
    :domain (Placeable ?b ?r)
    :outputs (?p)
    :certified (and (Pose ?b ?p) (Contained ?b ?p ?r))
  )
  (:stream inverse-kinematics ;Comments?
    :inputs (?b ?p)
    :domain (Pose ?b ?p)
    :outputs (?q)
    :certified (and (Conf ?q) (Kin ?b ?q ?p))
  )
  (:stream plan-motion ;Comments?
    :inputs (?q1 ?q2)
    :domain (and (Conf ?q1) (Conf ?q2))
    :outputs (?t)
    :certified (and (Traj ?t) (Motion ?q1 ?t ?q2))
  )
  ; (:stream test-region
  ;  :inputs (?b ?p ?r)
  ;  :domain (and (Pose ?b ?p) (Region ?r))
  ;  :outputs ()
  ;  :certified (Contained ?b ?p ?r)
  ; )

  ;(:fluent-stream (Valid) ; state-stream
  ;  ; :predicates AtPose
  ;)
)